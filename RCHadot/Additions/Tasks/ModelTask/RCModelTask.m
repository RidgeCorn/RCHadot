//
//  RCModelTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelTask.h"
#import "RCHTTPClient.h"
#import "RCModelHelper.h"
#import "RCBot.h"
#import "RCLogger.h"
#import "RCClassHelper.h"
#import "NSString+RCStorage.h"
#import <UIApplication+RCApplication.h>

@interface RCModelTask ()

@property (nonatomic) AFHTTPRequestOperation *currentHTTPRequestOperation;

@end

@implementation RCModelTask

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *key = [aDecoder decodeObjectForKey:@"key"];
    
    if(self = [self initWithKey:key]) {
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.key forKey:@"key"];
}

- (id)initWithKey:(NSString *)key refsByObject:(id)object {
    if(self = [super initWithKey:key refsByObject:object]) {
        [self commonConfig];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        [self commonConfig];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock {
    if (self = [super initWithKey:key runBlock:runBlock]) {
        [self commonConfig];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath {
    if (self = [self initWithKey:key]) {
        _type = type;
        _requestPath = requestPath;
    }

    return self;
}

- (void)commonConfig {
    self.delegate = self;

    _requestParams = [@{} mutableCopy];
    _modelsMapping = [@{} mutableCopy];
    _responseModels = [@{} mutableCopy];

    [RACObserve(self, state) subscribeNext:^(NSNumber *state) {
        if (_stateBlock) {
            _stateBlock(self);
        }
    }];
}

#pragma mark - Delegate

- (BOOL)start {
    if (_runBlock) {
        _runBlock(self);
    } else {
        [UIApplication beginNetworkTask];
        
        [_responseModels removeAllObjects];
        
        switch (self.type) {
            case RCModelTaskTypeLoadFromServerWithGet: {
                _currentHTTPRequestOperation = [HTTPClient getPath:_requestPath parameters:_requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithPost: {
                _currentHTTPRequestOperation = [HTTPClient postPath:_requestPath parameters:_requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithPut: {
                _currentHTTPRequestOperation = [HTTPClient putPath:_requestPath parameters:_requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithDelete: {
                _currentHTTPRequestOperation = [HTTPClient deletePath:_requestPath parameters:_requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromCache: {
                [UIApplication endNetworkTask];

            }
                break;
                
            default:
                break;
        }
    }
    return YES;
}

- (BOOL)cancel {
#warning TODO cancel _runBlock
    [_currentHTTPRequestOperation cancel];

    RCLog(@"Canceled current HTTP request operation:%@\n", _currentHTTPRequestOperation);
    
    [UIApplication endNetworkTask];

    return YES;
}

- (BOOL)handleRequestOperation:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject error:(NSError**)err {
    BOOL completed = YES;
    if (responseObject && !*err) {
        _responseData = responseObject;
        _responseJSONDict = [RCModelHelper parseData:responseObject error:err];
        
        if (_modelsMapping && !*err) {
            NSArray *allModelKeys = [_modelsMapping allKeys];
            for (NSString *modelKey in allModelKeys) {
                Class modelClass = ((RCClassHelper *)[_modelsMapping objectForKey:modelKey]).cls;
                NSString *key = [modelKey addKeyPrefixForClass:self.refsObj ? [self.refsObj class] : modelClass];
                
                id jsonValue = nil;
                @try { //handle null data
                    jsonValue = [modelKey hasPrefix:@"__"] ? _responseJSONDict : [_responseJSONDict valueForKeyPath:modelKey];
                } @catch (NSException *exception) {
                    RCLog(@"Exception: %@", exception);
                }
                
                if ([jsonValue isKindOfClass:[NSDictionary class]]) {
                    [_responseModels setObject:[RCModelHelper modelByClass:modelClass initWithDictionary:jsonValue error:err] forKey:key];
                } else if ([jsonValue isKindOfClass:[NSArray class]]) {
                    [_responseModels setObject:[RCModelHelper modelsByClass:modelClass initWithArray:jsonValue error:err] forKey:key];
                } else {
                    RCLog(@"Unsupported object %@", jsonValue);
                }
            }
        }
    } else {
        NSString *errorString = @"NO Response Data!";
        if (responseObject) {
            errorString = [NSString stringWithFormat:@"HTTP Request Error!!!\nOperation: %@", operation.responseString];
        }
        RCLog(@"%@", errorString);
        
        *err = [NSError errorWithDomain:[NSStringFromClass(self.class) stringByAppendingString:@"_RCModelTaskError"] code:404 userInfo:@{NSLocalizedDescriptionKey: errorString}];
    }
    
    if (*err) {
        completed = NO;
    }
    
    return completed;
}

- (void)handleError:(NSError *)error {
    if (error) {
        RCLog(@"Error: %@", error);
        self.error = error;
        self.state = RCTaskStateCompletedWithError;
    } else {
        self.state = RCTaskStateCompletedWithSucceeded;
    }
    
    [UIApplication endNetworkTask];
}

#pragma mark - Params

- (void)setParam:(id)value withKey:(NSString *)key {
    [_requestParams setObject:value forKey:key];
}

- (id)paramWithKey:(NSString *)key {
    return [_requestParams objectForKey:key];
}

- (void)removeParamWithKey:(NSString *)key {
    [_requestParams removeObjectForKey:key];
}

- (void)resetParams {
    [_requestParams removeAllObjects];
}

#pragma mark - Model Class
- (void)setModelClass:(Class)cls withResponsKey:(NSString *)key {
    [_modelsMapping setObject:[RCClassHelper objectFromClass:cls] forKey:key];
}

- (Class)modelClassWithKey:(NSString *)key {
    RCClassHelper *helperClass = [_modelsMapping objectForKey:key];
    
    return helperClass.cls;
}

- (id)modelWithKey:(id)key {
    key = [key addKeyPrefixForClass:self.refsObj ? [self.refsObj class] : ((RCClassHelper *)[_modelsMapping objectForKey:key]).cls];
    
    return [_responseModels objectForKey:key];
}

- (void)removeModelClassWithKey:(NSString *)key {
    [_modelsMapping removeObjectForKey:key];
}

- (void)resetModels {
    [_modelsMapping removeAllObjects];
}

@end
