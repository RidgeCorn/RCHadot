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
    RCModelTaskTypeLoadFromCache,
    RCModelTaskTypeLoadFromDatabase
};

@interface RCModelTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) NSString *requestPath;

@property (nonatomic) NSString *userKey;
@property (nonatomic) NSString *modelsParamsKey;
@property (nonatomic) NSDictionary *requestParams;
@property (nonatomic) NSString *fromCacheKey;

@property (nonatomic) NSDictionary *requestKeyMapping; // Value means keyPath
@property (nonatomic) NSDateFormatter *dateFormatter;

@property (nonatomic) Class toModelClass;
@property (nonatomic) NSDictionary *toModelKeyValueMapping;
@property (nonatomic) NSString *toModelsKey;

@property (nonatomic) NSString *toCacheKey;

@property (nonatomic) RCModelTaskType type;
@property (nonatomic) BOOL cacheData;
@property (nonatomic) BOOL saveData;

@end
