//
//  RCModelTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
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

@property (nonatomic) RCModelTaskType type;
@property (nonatomic) NSString *requestPath;
@property (nonatomic) NSMutableDictionary *requestParams;
@property (nonatomic) NSMutableDictionary *modelsMapping;
@property (nonatomic) id responseData;
@property (nonatomic) NSDictionary *responseJSONDict;
@property (nonatomic) NSMutableDictionary *responseModels;

- (id)initWithKey:(id)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath;

- (void)setParam:(id)value withKey:(id)key;
- (id)paramWithKey:(id)key;
- (void)removeParamWithKey:(id)key;
- (void)resetParams;

- (void)setModelClass:(Class)cls withResponsKey:(id)key;// key means keyPath
- (id)modelWithKey:(id)key;
- (Class)modelClassWithKey:(id)key;
- (void)removeModelClassWithKey:(id)key;
- (void)resetModels;

@end
