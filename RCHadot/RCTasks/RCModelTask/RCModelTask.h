//
//  RCModelTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import "RCModelOptions.h"

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
@property (nonatomic) RCModelOptions *options;

- (id)initWithKey:(NSString *)key type:(RCModelTaskType)type requestPath:(NSString *)requestPath options:(RCModelOptions *)options;

@end
