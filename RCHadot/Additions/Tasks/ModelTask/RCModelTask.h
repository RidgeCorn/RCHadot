//
//  RCModelTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import "RCModelTaskOptions.h"

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
@property (nonatomic) RCModelTaskOptions *options;

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath options:(RCModelTaskOptions *)options;

- (void)setParam:(id)value withKey:(NSString *)key;
- (id)paramWithKey:(NSString *)key;
- (void)removeParamWithKey:(NSString *)key;
- (void)resetParams;

- (void)setModelClass:(Class)cls withResponsKey:(NSString *)key;// key means keyPath
- (id)modelWithKey:(NSString *)key;
- (Class)modelClassWithKey:(NSString *)key;
- (void)removeModelClassWithKey:(NSString *)key;
- (void)resetModels;

@end
