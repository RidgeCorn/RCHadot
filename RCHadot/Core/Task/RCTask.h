//
//  RCTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

typedef NS_ENUM(NSUInteger, RCTaskState) {
    RCTaskStateRecored,
    RCTaskStateStart,
    RCTaskStateCompletedWithSucceeded,
    RCTaskStateCompletedWithError
};

@class RCTask;

typedef void (^RCTaskBlock)(RCTask *task);

@protocol RCTaskHandleDelegate <NSObject>
// Return NO if the task can't be processed, or with error.
@required
- (BOOL)handleStart:(RCTask <RCTaskHandleDelegate> *)task;

@optional
- (BOOL)handleRecord:(RCTask <RCTaskHandleDelegate> *)task;

- (void)handleRemove:(RCTask <RCTaskHandleDelegate> *)task;
- (void)handleError:(NSError *)error;

@end

@interface RCTask : RCObject <NSCopying, NSCoding>

@property (nonatomic) NSString *key;
@property (nonatomic, copy) RCTaskBlock runBlock;
@property (nonatomic, weak) id <RCTaskHandleDelegate> delegate;
@property (nonatomic) RCTaskState state;
@property (nonatomic) NSError *error;

- (id)initWithKey:(NSString *)key;

@end
