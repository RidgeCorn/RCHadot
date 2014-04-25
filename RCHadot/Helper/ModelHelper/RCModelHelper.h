//
//  RCModelHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCModelHelper : RCObject

+ (NSString *)modelCacheKeyWithDataCacheKey:(NSString *)key;

+ (void)cacheModel:(id)model forKey:(NSString *)key;
+ (id)modelForCacheKey:(NSString *)key;

+ (id)modelClass:(Class)cls initWithDictionary:(NSDictionary *)dict error:(NSError**)err;
+ (NSArray *)modelsByClass:(Class)cls initWithArray:(NSArray *)arr error:(NSError**)err;

+ (NSDictionary *)parseData:(id)responseObject withKey:(NSString *)key error:(NSError **)err;

@end
