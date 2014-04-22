//
//  RCCacheHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCCacheHelper.h"
#import "NSDictionary+RCDictionary.h"

@implementation RCCacheHelper

+ (NSString *)keyPrefixForClass:(Class)cls {
    returnc(keyPrefix,
            NSString *keyPrefix = [NSString stringWithFormat:@"__%@_(managedByRCHadot)_", NSStringFromClass(cls)];
            );
}

+ (NSString *)keyPrefixForString:(NSString *)string {
    returnc(keyPrefix,
            NSString *keyPrefix = [NSString stringWithFormat:@"__%@_(managedByRCHadot)_", string];
            );
}

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths {
    returnc(dict,
            NSMutableDictionary *dict = [@{} mutableCopy];NSString *valuePathKey;
            
            if (cachePaths) {
                for (NSString *key in cachePaths) {
                    NSInteger dotLocation = [key rangeOfString:@"."].location;

                    if (dotLocation == NSNotFound) {
                        if (key) {
                            [dict setValue:[Cache objectForKey:[[self keyPrefixForString:key] stringByAppendingString:key]] forKey:key];
                        }
                    } else {
                       valuePathKey = [key substringToIndex:dotLocation];
                        NSString *cacheKey = [[self keyPrefixForString:valuePathKey] stringByAppendingString:valuePathKey];
                        
                        id value = [Cache objectForKey:cacheKey];
                        
                        if ([value isKindOfClass:[NSDictionary class]]) {
                            valuePathKey = [key substringFromIndex:dotLocation + 2];
                            NSString *sepatator = [key substringWithRange:NSMakeRange(dotLocation + 1, 1)];
                            
                            [dict setValue:[value valueForKeyPath:valuePathKey separatedString:sepatator] forKey:valuePathKey];
                            
                        } else {
                            [dict setValue:value forKey:valuePathKey];
                        }
                    }
                }
            }
            );
}

+ (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withType:(RCModelOptionsStorageType)type {
    NSString *cacheKey = [[self keyPrefixForString:key] stringByAppendingString:key];

    switch (type) {
        case RCModelOptionsStorageTypeWrite: {
            [Cache setObject:object forKey:cacheKey];
        }
            break;
        case RCModelOptionsStorageTypeAppend: {
            id value = [Cache objectForKey:cacheKey];
            
            if (value) {
                value = [self appendData:object to:value];
                [Cache setObject:value forKey:cacheKey];
            } else {
                [Cache setObject:object forKey:cacheKey];
            }
        }
            break;
        default:
            break;
    }
}

+ (void)setObject:(id<NSCoding>)object forKey:(NSString *)key {
    [self setObject:object forKey:key withType:RCModelOptionsStorageTypeWrite];
}

+ (id)objectForKey:(NSString *)key {
    return [Cache objectForKey:[[self keyPrefixForString:key] stringByAppendingString:key]];
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
