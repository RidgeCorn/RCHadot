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
#import "NSString+RCStorage.h"
#import <NSObject+RCVerify.h>

@interface RCModelHelper ()

@end

@implementation RCModelHelper

+ (void)cacheModel:(id)model forKey:(NSString *)key {
    [RCCacheHelper setObject:model forKey:key];
}

+ (id)modelForCacheKey:(NSString *)key {
    return [RCCacheHelper objectForKey:key];
}

+ (id)modelByClass:(Class)cls initWithDictionary:(NSDictionary *)dict error:(NSError**)err {
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
    
    if ( ![NSObject isDataNil:arr] && [arr isKindOfClass:[NSArray class]]) {
        for (NSDictionary *modelDict in arr) {
            id model = [RCModelHelper modelByClass:cls initWithDictionary:modelDict error:err];
            
            if (model) {
                [models addObject:model];
                RCLog(@"Succeed! \nAdd %@ dict: %@\nmodel:%@", NSStringFromClass(cls), modelDict, model);
            } else {
                RCLog(@"Failed! \nAdd %@ dict: %@\nmodel:%@\nerror: %@", NSStringFromClass(cls), modelDict, model, *err);
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

+ (NSDictionary *)parseData:(id)responseObject error:(NSError **)err {
    return [self parseData:responseObject withKey:nil error:err];
}

@end
