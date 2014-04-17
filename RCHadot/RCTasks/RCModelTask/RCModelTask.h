//
//  RCModelTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCTask.h"

typedef NS_ENUM(NSUInteger, RCModelTaskType) {
    RCModelTaskTypeLoadFromServerWithGet,
    RCModelTaskTypeLoadFromServerWithPost,
    RCModelTaskTypeLoadFromServerWithPut,
    RCModelTaskTypeLoadFromServerWithDelete,
    RCModelTaskTypeLoadFromCache
};

@interface RCModelTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) NSString *requestPath;

@property (nonatomic) NSDictionary *requestParams;
@property (nonatomic) NSArray *cacheValuePaths;

@property (nonatomic) NSDictionary *requestKeyMapping;
@property (nonatomic) NSString *responseDataKeyPath;

@property (nonatomic) NSString *toCacheKey;

@property (nonatomic) RCModelTaskType type;

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath cacheValuePaths:(NSArray *)cacheValuePaths requestKeyMapping:(NSDictionary *)requestKeyMapping responseDataKeyPath:(NSString *)responseDataKeyPath toCacheKey:(NSString *)toCacheKey;

@end
