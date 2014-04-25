//
//  RCModelHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelHelper.h"
#import "RCCacheHelper.h"
#import <JSONModel.h>
#import <Mantle.h>
#import "RCLogger.h"
#import "RCVerifyHelper.h"

@interface RCModelHelper ()

@end

@implementation RCModelHelper

+ (NSString *)modelCacheKeyWithDataCacheKey:(NSString *)key {
    return [NSStringFromClass(self.class) stringByAppendingFormat:@"_%@", key ?: @""];
}

+ (void)cacheModel:(id)model forKey:(NSString *)key {
    [RCCacheHelper setObject:model forKey:[self modelCacheKeyWithDataCacheKey:key]];
}

+ (id)modelForCacheKey:(NSString *)key {
    return [RCCacheHelper objectForKey:[self modelCacheKeyWithDataCacheKey:key]];
}

+ (id)modelClass:(Class)cls initWithDictionary:(NSDictionary *)dict error:(NSError**)err {
    id model;
    
    if ([cls isSubclassOfClass:[JSONModel class]]) {
        model = [[cls alloc] initWithDictionary:dict error:err];
    } else if ([cls isSubclassOfClass:[MTLModel class]]) {
        model = [MTLJSONAdapter modelOfClass:cls fromJSONDictionary:dict error:err];
    } else {
        *err = [NSError errorWithDomain:[NSStringFromClass(self.class) stringByAppendingString:@"_RCModelTaskError"] code:404 userInfo:@{NSLocalizedDescriptionKey: @"Model Class NOT Support"}];
    }

    return model;
}

+ (NSArray *)modelsByClass:(Class)cls initWithArray:(NSArray *)arr error:(NSError **)err {
    NSMutableArray *models = [@[] mutableCopy];
    
    if ( ![RCVerifyHelper isDataNil:arr] && [arr isKindOfClass:[NSArray class]]) {
        for (NSDictionary *modelDict in arr) {
            NSError *error = nil;
            id model = [RCModelHelper modelClass:cls initWithDictionary:modelDict error:&error];
            
            if (model) {
                [models addObject:model];
                RCLog(@"Succeed! \nAdd %@ dict: %@\nmodel:%@", NSStringFromClass(cls), modelDict, model);
            } else {
                RCLog(@"Failed! \nAdd %@ dict: %@\nmodel:%@\nerror: %@", NSStringFromClass(cls), modelDict, model, error);
            }
        }
    }
    RCLog(@"models: \n%@", models);

    return models;
}

+ (NSDictionary *)parseData:(id)responseObject withKey:(NSString *)key error:(NSError **)err {
    NSMutableDictionary *resData = [@{} mutableCopy];
    NSDictionary *tmpDict = responseObject;
    
    if ( ![tmpDict isKindOfClass:[NSDictionary class]]) {
        tmpDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:err];
    }
    
    [resData addEntriesFromDictionary:(key && [key length]) ? [tmpDict valueForKeyPath:key] : tmpDict];
    
    return resData;
}

@end
