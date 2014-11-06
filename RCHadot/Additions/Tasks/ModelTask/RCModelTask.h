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
@property (nonatomic, strong) NSString *requestPath;
@property (nonatomic, strong) NSMutableDictionary *requestParams;
@property (nonatomic, strong) NSMutableDictionary *modelsMapping;
@property (nonatomic, strong) id responseData;
@property (nonatomic, strong) NSDictionary *responseJSONDict;
@property (nonatomic, strong) NSMutableDictionary *responseModels;

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
