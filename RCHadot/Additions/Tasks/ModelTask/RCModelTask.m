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

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        self.delegate = self;
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath options:(RCModelTaskOptions *)options {
    if (self = [self initWithKey:key]) {
        _type = type;
        _requestPath = requestPath;
        _options = options;
    }
    
    return self;
}

- (NSDictionary *)filterParamsFromDictionary:(NSDictionary *)allParams {
    NSMutableDictionary *params = [@{} mutableCopy];
    NSArray *allFilterKeys = [_options.requestKeyMapping allKeys];
    for (NSString *filterKey in allFilterKeys) {
        if ( ![allParams valueForKey:filterKey]) {
            RCLog(@"NO Request Key Found (%@)", filterKey);
        } else {
            [params setValue:[allParams valueForKey:filterKey] forKey:[_options.requestKeyMapping valueForKey:filterKey]];
        }
    }
    
    return params;
}

- (NSDictionary *)genParameters {
    NSMutableDictionary *params = [@{} mutableCopy];
    if (_options.requestParams) {
        [params addEntriesFromDictionary:_options.requestParams];
    } else {
        [params addEntriesFromDictionary:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths]];
        
        params = [[self filterParamsFromDictionary:params] mutableCopy];
    }
    
    return params;
}

- (void)handleStart:(NSString *)taskKey {
    RCModelTask *task = (RCModelTask *)[Bot taskForKey:taskKey];
    
    switch (task.type) {
        case RCModelTaskTypeLoadFromServerWithGet: {
            [HTTPClient getPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *err = nil;

                [self handleRequestOperation:operation withResponse:responseObject error:&err];
                
                [self handleError:err];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithPost: {
            [HTTPClient postPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *err = nil;

                [self handleRequestOperation:operation withResponse:responseObject error:&err];
                
                [self handleError:err];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithPut: {
            [HTTPClient putPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *err = nil;

                [self handleRequestOperation:operation withResponse:responseObject error:&err];
                
                [self handleError:err];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithDelete: {
            [HTTPClient deletePath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSError *err = nil;

                [self handleRequestOperation:operation withResponse:responseObject error:&err];
                
                [self handleError:err];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromCache: {
            if (_options.cacheValuePaths) {
                NSError *err = nil;
                
                [self handleRequestOperation:nil withResponse:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths] error:&err];
                
                [self handleError:err];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)handleRequestOperation:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject error:(NSError**)err {
    if (responseObject) {
        if (_options.toCacheKey) {
            NSDictionary *dict = [RCModelHelper parseData:responseObject withKey:_options.responseDataKeyPath error:err];
            [RCCacheHelper setObject:dict forKey:_options.toCacheKey withType:_options.storageType];
            
            if (_options.toModelClass && !*err) {
                [RCCacheHelper setObject:[RCModelHelper modelClass:_options.toModelClass initWithDictionary:dict error:err] forKey:[RCModelHelper modelCacheKeyWithDataCacheKey: _options.toCacheKey] withType:_options.storageType];
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
}
@end
