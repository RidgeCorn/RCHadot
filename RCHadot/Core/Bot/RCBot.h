//
//  RCBot.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import "RCTask.h"

#define Bot [RCBot sharedBot]

@interface RCBot : RCObject

+ (instancetype)sharedBot;

+ (instancetype)newBot;

- (NSArray *)allTaskKeys;
- (NSArray *)allTasks;

- (void)remove:(NSString *)taskKey;

- (BOOL)startTaskWithKey:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone;
- (BOOL)startTaskWithKey:(NSString *)taskKey;
- (BOOL)startTask:(RCTask <RCTaskHandleDelegate> *)task;

- (BOOL)cancelTaskWithKey:(NSString *)taskKey;
- (BOOL)cancelTask:(RCTask <RCTaskHandleDelegate> *)task;

- (BOOL)record:(RCTask <RCTaskHandleDelegate> *)task;

- (id)taskForKey:(NSString *)taskKey;

@end
