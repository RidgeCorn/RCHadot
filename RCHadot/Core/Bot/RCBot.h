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

- (void)remove:(NSString *)taskKey;

- (BOOL)start:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone;
- (BOOL)start:(NSString *)taskKey;

- (BOOL)record:(RCTask *)task;

- (id <RCTaskHandleDelegate>)taskForKey:(NSString *)taskKey;

@end
