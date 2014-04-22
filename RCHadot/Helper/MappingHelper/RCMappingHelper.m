//
//  RCMappingHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCMappingHelper.h"
#import "RCCacheHelper.h"

@interface RCMappingHelper ()

@end

@implementation RCMappingHelper

+ (NSString *)mappingCacheKeyWithCollectionKey:(NSString *)key {
    return [NSStringFromClass(self.class) stringByAppendingFormat:@"_%@", key ?: @""];
}

+ (id)collectionForKey:(NSString *)collectionKey {
    NSString *key = [self mappingCacheKeyWithCollectionKey:collectionKey];
    
    return [RCCacheHelper objectForKey:key];
}

+ (void)addCollection:(NSMutableDictionary *)dict withKey:(NSString *)collectionKey {
    NSString *key = [self mappingCacheKeyWithCollectionKey:collectionKey];

    [RCCacheHelper setObject:dict forKey:key];
}

+ (void)setValue:(id)value forKey:(NSString *)valueKey withCollectionKey:(NSString *)collectionKey {
    NSString *key = [self mappingCacheKeyWithCollectionKey:collectionKey];

    NSMutableDictionary *collection = [self collectionForKey:key];
    
    if (collection && [collection isKindOfClass:[NSMutableDictionary class]]) {
        [collection setValue:value forKey:valueKey];
    } else {
        if ( !collection) {
            collection = [@{} mutableCopy];
        }
        
        NSMutableDictionary *dict = [collection mutableCopy];

        [dict setValue:value forKey:valueKey];
        
        [self addCollection:dict withKey:key];
    }
}

+ (id)valueForKey:(NSString *)valueKey withCollectionKey:(NSString *)collectionKey {
    NSString *key = [self mappingCacheKeyWithCollectionKey:collectionKey];

    return [[self collectionForKey:key] valueForKey:valueKey];
}

@end
