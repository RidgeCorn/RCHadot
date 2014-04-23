//
//  RCCacheHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import "RCCache.h"
#import "RCModelTaskOptions.h"

@class RCCache;

#define Cache [RCCache sharedCache]

@interface RCCacheHelper : RCObject

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths;

+ (void)setObject:(id <NSCoding>)object forKey:(NSString *)key withType:(RCModelOptionsStorageType)type;

+ (void)setObject:(id<NSCoding>)object forKey:(NSString *)key;

+ (id)objectForKey:(NSString *)key;

@end
