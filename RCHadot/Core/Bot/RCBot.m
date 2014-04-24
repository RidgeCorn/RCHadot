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
- (BOOL)startTask:(RCTask<RCTaskHandleDelegate> *)task {
    BOOL called = NO;
    
    task.state = RCTaskStateStart;
    
    if ([task.delegate respondsToSelector:@selector(handleStart:)]) {
        called = [task.delegate handleStart:task];
    } else {
        if (task.delegate) {
            @throw [NSException exceptionWithName:@"Required Method NOT implemented" reason:@"Required Method 'handleStart:' in protocol not implemented." userInfo:nil];
        } else {
            @throw [NSException exceptionWithName:@"Delegate NOT setted" reason:@"RCTask's delegate <RCTaskHandleDelegate> has not be setted." userInfo:nil];
        }
    }
    
    return called;
}

- (BOOL)startTaskWithKey:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone {
    BOOL called = NO;
    RCTask <RCTaskHandleDelegate> *task = nil;
    
    if (taskKey) {
        task = [_tasks objectForKey:taskKey];
    }
    
    if (task) {
        called = [self startTask:task];
        
        if(called && removeAfterDone) {
            [self remove:task.key];
        }
    }
    
    return called;
}

- (BOOL)startTaskWithKey:(NSString *)taskKey {
    return [self startTaskWithKey:taskKey removeAfterDone:NO];
}

- (BOOL)record:(RCTask <RCTaskHandleDelegate> *)task {
    BOOL record = NO;
    NSString *taskKey = task.key;
    
    if (taskKey && !([_tasks objectForKey:taskKey] && [[_tasks objectForKey:taskKey] isEqual:task])) {
        [_tasks setObject:task forKey:taskKey];
        
        if ([task.delegate respondsToSelector:@selector(handleRecord:)]) {
            record = [task.delegate handleRecord:task];
        }
        
        task.state = RCTaskStateRecored;
    }
    
    return record;
}

- (void)remove:(NSString *)taskKey {
    RCTask <RCTaskHandleDelegate> *task = [_tasks objectForKey:taskKey];
    
    if ([task.delegate respondsToSelector:@selector(handleRemove:)]) {
        [task.delegate handleRemove:task];
    }
    
    task.delegate = nil;
    task = nil;
    
    [_tasks removeObjectForKey:taskKey];
}

- (id <RCTaskHandleDelegate>)taskForKey:(NSString *)taskKey {
    return [_tasks objectForKey:taskKey];
}

@end
