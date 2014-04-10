//
//  RCTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#define blockc(value, ...) ({ __VA_ARGS__;value;})

#define returnc(value, ...) return blockc(value, __VA_ARGS__)

@class RCTask;

typedef void (^RCTaskBlock)(RCTask *task);

@protocol RCTaskHandleDelegate <NSObject>

@required

- (void)handleStart:(NSString *)taskKey;

@optional

- (void)handleRecord:(id)task;

- (void)handleRemove:(NSString *)taskKey;

@end

@interface RCTask : RCObject

@property (nonatomic) NSString *key;
@property (nonatomic, copy) RCTaskBlock runBlock;
@property (nonatomic, weak) id <RCTaskHandleDelegate> delegate;

@end
