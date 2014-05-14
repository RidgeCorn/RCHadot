//
//  RCCacheHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCCacheHelper.h"
#import "NSDictionary+RCDictionary.h"
#import "NSString+RCStorage.h"

@implementation RCCacheHelper

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths {
    NSMutableDictionary *dict = [@{} mutableCopy];NSString *valuePathKey;
    
    if (cachePaths) {
        for (NSString *key in cachePaths) {
            NSInteger dotLocation = [key rangeOfString:@"."].location;
            
            if (dotLocation == NSNotFound) {
                if (key) {
                    [dict setValue:[Cache objectForKey:key] forKey:key];
                }
            } else {
                valuePathKey = [key substringToIndex:dotLocation];
                
                id value = [Cache objectForKey:valuePathKey];
                
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
    
    return dict;
}

+ (void)setObject:(id<NSCoding>)object forKey:(NSString *)cacheKey withType:(RCModelOptionsStorageType)type {
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
            
        case RCModelOptionsStorageTypeDisposable: {
            [Cache setObject:object forKey:[kRCModelOptionsStorageTypeDisposable stringByAppendingString:cacheKey]];
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
    return [Cache objectForKey:key];
}

+ (id)objectForDisposableKey:(NSString *)key {
    id value = [self objectForKey:[kRCModelOptionsStorageTypeDisposable stringByAppendingString:key]];
    
    if (value) {
        [Cache removeObjectForKey:[kRCModelOptionsStorageTypeDisposable stringByAppendingString:key]];
    }
    
    return value;
}

+ (id)appendData:(id)object to:(id)value {
    if ([value isKindOfClass:[NSArray class]] && [object isKindOfClass:[NSArray class]]) {
        value = [NSMutableArray arrayWithArray:value];
        [value addObjectsFromArray:object];
    } else if ([value isKindOfClass:[NSDictionary class]] && [object isKindOfClass:[NSDictionary class]]) {
        value = [NSMutableDictionary dictionaryWithDictionary:value];
        [value addEntriesFromDictionary:object];
    }
    return value;
}

@end
