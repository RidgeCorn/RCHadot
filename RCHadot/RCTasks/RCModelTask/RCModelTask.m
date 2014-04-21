//
//  RCModelTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCModelTask.h"
#import "RCHTTPClient.h"
#import "RCCacheHelper.h"
#import "RCBot.h"

@implementation RCModelTask

- (id)initWithKey:(NSString *)key {
    returnc(self,
            if(self = [super initWithKey:key]) {
                self.delegate = self;
            });
}

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath options:(RCModelOptions *)options {
    returnc(self,
            if (self = [self initWithKey:key]) {
                _type = type;
                _requestPath = requestPath;
                _options = options;
            }
    );
}

- (NSDictionary *)filterParamsFromDictionary:(NSDictionary *)allParams {
    NSMutableDictionary *params = [@{} mutableCopy];
    NSArray *allFilterKeys = [_options.requestKeyMapping allKeys];
    for (NSString *filterKey in allFilterKeys) {
        if ( ![allParams valueForKey:filterKey]) {
//            NSLog(@"NO Request Key Found (%@)", filterKey);
        } else {
            [params setValue:[allParams valueForKey:filterKey] forKey:[_options.requestKeyMapping valueForKey:filterKey]];
        }
    }
    
    return params;
}

- (NSDictionary *)genParameters {
    returnc(params,
            NSMutableDictionary *params = [@{} mutableCopy];
            if (_options.requestParams) {
                [params addEntriesFromDictionary:_options.requestParams];
            } else {
                [params addEntriesFromDictionary:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths]];
                
                params = [[self filterParamsFromDictionary:params] mutableCopy];
            }
            );
}

- (void)handleStart:(NSString *)taskKey {
    RCModelTask *task = [Bot taskForKey:taskKey];
    switch (task.type) {
        case RCModelTaskTypeLoadFromServerWithGet: {
            [HTTPClient getPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestOperation:operation withResponse:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithPost: {
            [HTTPClient postPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestOperation:operation withResponse:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithPut: {
            [HTTPClient putPath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestOperation:operation withResponse:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromServerWithDelete: {
            [HTTPClient deletePath:_requestPath parameters:[self genParameters] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self handleRequestOperation:operation withResponse:responseObject];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self handleError:error];
            }];
        }
            break;
            
        case RCModelTaskTypeLoadFromCache: {
            if (_options.cacheValuePaths) {
                [self handleRequestOperation:nil withResponse:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths]];
            }
        }
            break;
            
        default:
            break;
    }
}

- (void)handleRequestOperation:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject {
    if (responseObject) {
        if (_options.toCacheKey) {
            [RCCacheHelper setObject:[self parseData:responseObject] forKey:_options.toCacheKey withType:_options.storageType];
        }
    } else {
//        NSLog(@"NO Response Data!");
    }
    
    self.state = RCTaskStateCompletedWithSucceeded;
}

- (NSDictionary *)parseData:(id)responseObject {
    NSMutableDictionary *resData = [@{} mutableCopy];
    NSDictionary *tmpDict = responseObject;
    
    if ( ![tmpDict isKindOfClass:[NSDictionary class]]) {
        NSError *error = nil;
        tmpDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
    }
    
    [resData addEntriesFromDictionary:_options.responseDataKeyPath && [_options.responseDataKeyPath length] ? [tmpDict valueForKeyPath:_options.responseDataKeyPath] : tmpDict];

    return resData;
}

- (void)handleError:(NSError *)error {
    self.error = error;
    self.state = RCTaskStateCompletedWithError;
}
@end
