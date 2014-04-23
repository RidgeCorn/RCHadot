//
//  RCBot.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCBot.h"
#import <Routable.h>
#import "RCStyleSheetsHelper.h"
#import "RCTask.h"
#import "RCLogger.h"

@interface RCBot()

@property (nonatomic) NSMutableDictionary *tasks;

@end

@implementation RCBot

#pragma mark - Init Bot
- (id)init {
    if (self = [super init]) {
        _tasks = [@{} mutableCopy];
    }
    
    return self;
}

+ (instancetype)sharedBot {
    static RCBot *_sharedBot;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedBot = [self newBot];
    });
    
    return _sharedBot;
}

#pragma mark New Bot

+ (instancetype)newBot {
    return [[self alloc] init];
}

#pragma mark - allTask

- (NSArray *)allTaskKeys {
    return [_tasks allKeys];
}

- (NSArray *)allTasks {
    return [_tasks allValues];
}

#pragma mark - Start Task
- (BOOL)start:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone {
    BOOL called = NO;
    RCTask *task = nil;
    
    if (taskKey) {
        task = [_tasks objectForKey:taskKey];
    }
    
    if (task) {
        task.state = RCTaskStateStart;
        
        if ([task.delegate respondsToSelector:@selector(handleStart:)]) {
            [task.delegate handleStart:taskKey];
        } else {
            if (task.delegate) {
                @throw [NSException exceptionWithName:@"Required Method NOT implemented" reason:@"Required Method 'handleStart:' in protocol not implemented." userInfo:nil];
            } else {
                @throw [NSException exceptionWithName:@"Delegate NOT setted" reason:@"RCTask's delegate <RCTaskHandleDelegate> has not be setted." userInfo:nil];
            }
        }
        
        called = YES;
    }
    
    if(called && removeAfterDone) {
        [self remove:taskKey];
    }
    return called;
}

- (BOOL)start:(NSString *)taskKey {
    return [self start:taskKey removeAfterDone:NO];
}

- (BOOL)record:(RCTask *)task {
    BOOL record = NO;
    NSString *taskKey = task.key;
    
    if (taskKey && !([_tasks objectForKey:taskKey] && [[_tasks objectForKey:taskKey] isEqual:task])) {
        [_tasks setObject:task forKey:taskKey];
        
        if ([task.delegate respondsToSelector:@selector(handleRecord:)]) {
            [task.delegate handleRecord:task];
        }
        
        record = YES;
        
        task.state = RCTaskStateRecored;
    }
    
    return record;
}

- (void)remove:(NSString *)taskKey {
    RCTask *task = [_tasks objectForKey:taskKey];
    
    if ([task.delegate respondsToSelector:@selector(handleRemove:)]) {
        [task.delegate handleRemove:taskKey];
    }
    
    task.delegate = nil;
    task = nil;
    
    [_tasks removeObjectForKey:taskKey];
}

- (id <RCTaskHandleDelegate>)taskForKey:(NSString *)taskKey {
    return [_tasks objectForKey:taskKey];
}

@end
