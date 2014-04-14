//
//  RCModelTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCModelTask.h"
#import "RCHTTPClient.h"
#import "RCCache.h"
#import "RCBot.h"
#import <objc/runtime.h>
#import <CoreData+MagicalRecord.h>
#import "NSManagedObject+RCStorage.h"

@implementation RCModelTask

- (NSDictionary *)propertiesFromObject:(id)object {
    NSMutableDictionary *propertiesDictionary = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([object class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithUTF8String:property_getName(property)];
        id propertyValue = [object valueForKey:(NSString *)propertyName];
        if (propertyValue) [propertiesDictionary setObject:propertyValue forKey:propertyName];
    }
    
    free(properties);
    
    return propertiesDictionary;
}

- (NSDictionary *)filterParamsFromDictionary:(NSDictionary *)allParams {
    NSMutableDictionary *params = [@{} mutableCopy];
    NSArray *allFilterKeys = [_requestKeyMapping allKeys];
    for (NSString *filterKey in allFilterKeys) {
        if ( ![allParams valueForKey:filterKey]) {
            DDLogDebug(@"NO Request Key Found (%@)", filterKey);
        } else {
            [params setValue:[allParams valueForKey:filterKey] forKeyPath:[_requestKeyMapping valueForKey:filterKey]];
        }
    }
    return params;
}

- (NSDictionary *)genParameters {
    returnc(params,
            NSMutableDictionary *params = [@{} mutableCopy];
            if (_requestParams) {
                [params addEntriesFromDictionary:_requestParams];
            } else {
                [params addEntriesFromDictionary:[self propertiesFromObject:[Cache objectForKey:_userKey]]];
                NSArray *models = [Cache objectForKey:_modelsParamsKey];
                for (id model in models) {
                    [params addEntriesFromDictionary:[self propertiesFromObject:model]];
                }
                
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
            if (_fromCacheKey) {
                [self handleRequestOperation:nil withResponse:[Cache valueForKey:_fromCacheKey]];
            }

        }
            break;
        case RCModelTaskTypeLoadFromDatabase: {
            [Cache setValue:[_toModelClass MR_findAll] forKey:_toModelsKey];
        }
            break;
            
        default:
            break;
    }
}

- (void)handleRequestOperation:(AFHTTPRequestOperation *)operation withResponse:(id)responseObject {
    if (responseObject) {
        if (_toCacheKey) {
            [Cache setValue:responseObject forKey:_toCacheKey];
        }
        [self parseData:responseObject];
    } else {
        DDLogDebug(@"NO Response Data!");
    }
}

- (void)parseData:(id)responseObject {
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        if ([_toModelClass isSubclassOfClass:[NSManagedObject class]]) {
            NSManagedObject *model = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(_toModelClass) inManagedObjectContext:[NSManagedObjectContext MR_defaultContext]];
            [model updateFromDictionary:responseObject dateFormatter:_dateFormatter withMapping:_toModelKeyValueMapping];
            [Cache setValue:@[model] forKey:_toModelsKey];
        }
    }
}

- (void)handleError:(NSError *)error {
    DDLogError(@"\nError: %@", error.description);
}
@end
