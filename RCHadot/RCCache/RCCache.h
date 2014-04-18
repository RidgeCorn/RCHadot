//
//  RCCache.h
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import <TMCache.h>
#import "RCModelOptions.h"

#define Cache [RCCache sharedTMCache]

@interface RCCache : RCObject

+ (TMCache *)sharedTMCache;

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths;

+ (void)setObject:(id <NSCoding>)object forKey:(NSString *)key withType:(RCModelOptionsStorageType)type;

@end
