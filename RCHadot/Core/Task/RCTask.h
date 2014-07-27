//
//  RCTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import <ReactiveCocoa.h>

typedef NS_ENUM(NSUInteger, RCTaskState) {
    RCTaskStateRecored,
    RCTaskStateStart,
    RCTaskStateCompletedWithSucceeded,
    RCTaskStateCompletedWithError,
    RCTaskStateCanceled
};

@class RCTask;

@protocol RCTaskHandleDelegate <NSObject>
// Return NO if the task can't be processed, or with error.
@required
- (BOOL)start;

@optional
- (BOOL)record;
- (void)remove;
- (BOOL)cancel;

@end

typedef void (^RCTaskBlock)(id <RCTaskHandleDelegate> task_b);

@interface RCTask : RCObject <NSCopying, NSCoding> {
    RCTaskBlock _stateBlock;
    RCTaskBlock _runBlock;
}

@property (nonatomic) NSString *key;
@property (nonatomic, weak) id <RCTaskHandleDelegate> delegate;
@property (nonatomic) RCTaskState state;
@property (nonatomic) NSError *error;
@property (nonatomic) id refsObj;

- (id)initWithKey:(NSString *)key;
- (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock;
- (id)initWithKey:(NSString *)key refsByObject:(id)object;
- (void)handleStateBlock:(RCTaskBlock)stateBlock;
- (void)resetRunBlock:(RCTaskBlock)runBlock;

@end
