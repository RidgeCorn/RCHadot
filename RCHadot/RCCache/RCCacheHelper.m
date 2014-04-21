//
//  RCCacheHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCCacheHelper.h"
#import "NSDictionary+RCDictionary.h"

@implementation RCCacheHelper

+ (NSString *)keyPrefixForClass:(Class)cls {
    returnc(keyPrefix,
            NSString *keyPrefix = [NSString stringWithFormat:@"__%@_(managedByRCHadot)_", NSStringFromClass(cls)];
            );
}

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths {
    returnc(dict,
            NSMutableDictionary *dict = [@{} mutableCopy];
            if (cachePaths) {
                for (NSString *key in cachePaths) {
                    NSInteger dotLocation = [key rangeOfString:@"."].location;

                    if (dotLocation == NSNotFound) {
                        if (key) {
                            [dict setValue:[Cache objectForKey:key] forKey:key];
                        }
                    } else {
                        NSString *cacheKey = [key substringToIndex:dotLocation];
                        
                        id value = [Cache objectForKey:cacheKey];
                        
                        if ([value isKindOfClass:[NSDictionary class]]) {
                            NSString *valuePathKey = [key substringFromIndex:dotLocation + 2];
                            NSString *sepatator = [key substringWithRange:NSMakeRange(dotLocation + 1, 1)];
                            
                            [dict setValue:[value valueForKeyPath:valuePathKey separatedString:sepatator] forKey:valuePathKey];
                            
                        } else {
                            [dict setValue:value forKey:cacheKey];
                        }
                    }
                }
            }
            );
}

+ (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withType:(RCModelOptionsStorageType)type {
    switch (type) {
        case RCModelOptionsStorageTypeWrite: {
            [Cache setObject:object forKey:key];
        }
            break;
        case RCModelOptionsStorageTypeAppend: {
            id value = [Cache objectForKey:key];
            if (value) {
                value = [self appendData:object to:value];
                [Cache setObject:value forKey:key];
            } else {
                [Cache setObject:object forKey:key];
            }
        }
            break;
        default:
            break;
    }
}

+ (id)appendData:(id)object to:(id)value {
    returnc(value,
            if ([value isKindOfClass:[NSArray class]] && [object isKindOfClass:[NSArray class]]) {
                value = [NSMutableArray arrayWithArray:value];
                [value addObjectsFromArray:object];
            } else if ([value isKindOfClass:[NSDictionary class]] && [object isKindOfClass:[NSDictionary class]]) {
                value = [NSMutableDictionary dictionaryWithDictionary:value];
                [value addEntriesFromDictionary:object];
            }
            );
    
}

@end
