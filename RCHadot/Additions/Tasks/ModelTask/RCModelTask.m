//
//  RCModelTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelTask.h"
#import "RCHTTPClient.h"
#import "RCCacheHelper.h"
#import "RCModelHelper.h"
#import "RCBot.h"
#import "RCLogger.h"
#import "RCClassHelper.h"
#import "NSString+RCStorage.h"
#import "RCDeviceHelper.h"

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
        self.delegate = self;
        
        [RACObserve(self, state) subscribeNext:^(NSNumber *state) {
            if (_stateBlock) {
                _stateBlock(self);
            }
        }];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        self.delegate = self;
        
        [RACObserve(self, state) subscribeNext:^(NSNumber *state) {
            if (_stateBlock) {
                _stateBlock(self);
            }
        }];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath options:(RCModelTaskOptions *)options {
    if (self = [self initWithKey:key]) {
        _type = type;
        _requestPath = requestPath;
        _options = options;
        
        if ( !_options) {
            _options = [RCModelTaskOptions new];
        }
    }

    return self;
}

- (BOOL)handleStart:(RCModelTask *)task {
    if (_runBlock) {
        _runBlock(self);
    } else {
        [RCDeviceHelper beginNetworkTask];

        switch (task.type) {
            case RCModelTaskTypeLoadFromServerWithGet: {
                [HTTPClient getPath:_requestPath parameters:_options.requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithPost: {
                [HTTPClient postPath:_requestPath parameters:_options.requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithPut: {
                [HTTPClient putPath:_requestPath parameters:_options.requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromServerWithDelete: {
                [HTTPClient deletePath:_requestPath parameters:_options.requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    NSError *err = nil;
                    
                    [self handleRequestOperation:operation withResponse:responseObject error:&err];
                    
                    [self handleError:err];
                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [self handleError:error];
                }];
            }
                break;
                
            case RCModelTaskTypeLoadFromCache: {
                [RCDeviceHelper endNetworkTask];

            }
                break;
                
            default:
                break;
        }
    }
    return YES;
}

- (void)handleRequestOperation:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject error:(NSError**)err {
    if (responseObject) {
        if (_options.toCacheKey) {
            NSDictionary *dict = [RCModelHelper parseData:responseObject error:err];
            [RCCacheHelper setObject:dict forKey:_options.toCacheKey withType:_options.storageType];
            
            if (_options.modelsMapping && !*err) {
                NSArray *allModelKeys = [_options.modelsMapping allKeys];
                for (NSString *modelKey in allModelKeys) {
                    id jsonValue = [modelKey hasPrefix:@"__"] ? dict : [dict valueForKeyPath:modelKey];
                    if (jsonValue) {
                        Class modelClass = ((RCClassHelper *)[_options.modelsMapping objectForKey:modelKey]).cls;
                        NSString *key = [modelKey addKeyPrefixForClass:self.refsObj ? [self.refsObj class] : modelClass];
                        
                        if ([jsonValue isKindOfClass:[NSDictionary class]]) {
                            [RCCacheHelper setObject:[RCModelHelper modelByClass:modelClass initWithDictionary:jsonValue error:err] forKey:key withType:_options.storageType];
                        } else if ([jsonValue isKindOfClass:[NSArray class]]) {
                            [RCCacheHelper setObject:[RCModelHelper modelsByClass:modelClass initWithArray:jsonValue error:err] forKey:key withType:_options.storageType];
                        }
                    }
                }
            }
        }
    } else {
            RCLog(@"NO Response Data!");
    }
}

- (void)handleError:(NSError *)error {
    if (error) {
        self.error = error;
        self.state = RCTaskStateCompletedWithError;
    } else {
        self.state = RCTaskStateCompletedWithSucceeded;
    }
    
    [RCDeviceHelper endNetworkTask];
}

#pragma mark - Params

- (void)setParam:(id)value withKey:(NSString *)key {
    [self checkOptions];
    
    [_options.requestParams setObject:value forKey:key];
}

- (id)paramWithKey:(NSString *)key {
    return [_options.requestParams objectForKey:key];
}

- (void)removeParamWithKey:(NSString *)key {
    [_options.requestParams removeObjectForKey:key];
}

- (void)resetParams {
    [_options.requestParams removeAllObjects];
}

#pragma mark - Model Class
- (void)setModelClass:(Class)cls withResponsKey:(NSString *)key {
    [self checkOptions];
    
    [_options.modelsMapping setObject:[RCClassHelper objectFromClass:cls] forKey:key];
}

- (Class)modelClassWithKey:(NSString *)key {
    RCClassHelper *helperClass = [_options.modelsMapping objectForKey:key];
    
    return helperClass.cls;
}

- (id)modelWithKey:(id)key {
    key = [key addKeyPrefixForClass:self.refsObj ? [self.refsObj class] : ((RCClassHelper *)[_options.modelsMapping objectForKey:key]).cls];
    
    return [RCCacheHelper objectForKey:key];
}

- (void)removeModelClassWithKey:(NSString *)key {
    [_options.modelsMapping removeObjectForKey:key];
}

- (void)resetModels {
    [_options.modelsMapping removeAllObjects];
}

#pragma mark - Checking

- (void)checkOptions {
    if ( !_options) {
        _options = [RCModelTaskOptions new];
    }
    
    if ( !_options.requestParams) {
        _options.requestParams = [@{} mutableCopy];
    }
    
    if ( !_options.modelsMapping) {
        _options.modelsMapping = [@{} mutableCopy];
    }
}

@end
