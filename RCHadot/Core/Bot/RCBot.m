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

typedef NS_ENUM(NSUInteger, RCBotRunErrorLevel) {
    RCBotRunErrorLevelDefault = 0, // Nothing, keep working.
    RCBotRunErrorLevelDebugLog, // RCLog
    RCBotRunErrorLevelThrowException //@throw [NSException ...
};

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
    
    if ([task.delegate respondsToSelector:@selector(start)]) {
        called = [task.delegate start];
    } else {
        [self _logRunErrorWithTask:task whenCallingMethod:@"start" withErrorLevel:RCBotRunErrorLevelThrowException];
    }
    
    return called;
}

- (BOOL)startTaskWithKey:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone {
    BOOL called = NO;
    RCTask <RCTaskHandleDelegate> *task = [self taskForKey:taskKey];
    
    if (task) {
        called = [self startTask:task];
        
        if (called && removeAfterDone) {
            [self remove:task.key];
        }
    }
    
    return called;
}

- (BOOL)startTaskWithKey:(NSString *)taskKey {
    return [self startTaskWithKey:taskKey removeAfterDone:NO];
}

- (BOOL)cancelTask:(RCTask<RCTaskHandleDelegate> *)task {
    BOOL called = NO;
    
    if ([task.delegate respondsToSelector:@selector(cancel)]) {
        called = [task.delegate cancel];
        
        task.state = RCTaskStateCanceled;
    } else {
        [self _logRunErrorWithTask:task whenCallingMethod:@"cancel" withErrorLevel:RCBotRunErrorLevelDebugLog];
    }
    
    return called;
}

- (BOOL)cancelTaskWithKey:(NSString *)taskKey {
    return [self cancelTask:[self taskForKey:taskKey]];
}

- (BOOL)record:(RCTask <RCTaskHandleDelegate> *)task {
    BOOL record = NO;
    NSString *taskKey = task.key;
    
    if (taskKey && !([_tasks objectForKey:taskKey] && [[_tasks objectForKey:taskKey] isEqual:task])) {
        [_tasks setObject:task forKey:taskKey];
        
        if ([task.delegate respondsToSelector:@selector(record)]) {
            record = [task.delegate record];
        } else {
            [self _logRunErrorWithTask:task whenCallingMethod:@"record" withErrorLevel:RCBotRunErrorLevelDebugLog];
        }
        
        task.state = RCTaskStateRecored;
    }
    
    return record;
}

- (void)remove:(NSString *)taskKey {
    RCTask <RCTaskHandleDelegate> *task = [self taskForKey:taskKey];
    if (task) {
        [_tasks removeObjectForKey:taskKey];
        
        if ([task.delegate respondsToSelector:@selector(remove)]) {
            [task.delegate remove];
        } else {
            [self _logRunErrorWithTask:task whenCallingMethod:@"remove" withErrorLevel:RCBotRunErrorLevelDebugLog];
        }
        
        task.delegate = nil;
        task = nil;
    }
}

- (id)taskForKey:(NSString *)taskKey {
    return [_tasks objectForKey:taskKey ?: @""];
}

#pragma mark - Error Log
- (void)_logRunErrorWithTask:(RCTask <RCTaskHandleDelegate> *)task whenCallingMethod:(NSString *)method withErrorLevel:(RCBotRunErrorLevel)level {
    NSString *className = NSStringFromClass(task.class);
    
    static NSString *err_delegateNotSetsTitle = @"Delegate NOT setted.\n";
    NSString *err_delegateNotSetsContent = [NSString stringWithFormat:@"RCTask's delegate <RCTaskHandleDelegate> has not be setted in class %@.\n", className];
    
    static NSString *err_delegateMethodNotImplementsTitle = @"Required Method NOT implements.\n";
    NSString *err_delegateMethodNotImplementsContent = [NSString stringWithFormat:@"Required Method '%@' in protocol <RCTaskHandleDelegate> not implemented in class %@.\n", method, className];

    switch (level) {
        case RCBotRunErrorLevelDebugLog: {
            if (task.delegate) {
                RCLog(@"%@%@", err_delegateMethodNotImplementsTitle, err_delegateMethodNotImplementsContent);
            } else {
                RCLog(@"%@%@", err_delegateNotSetsTitle, err_delegateNotSetsContent);
            }
        }
            break;
        case RCBotRunErrorLevelThrowException: {
            if (task.delegate) {
                @throw [NSException exceptionWithName:err_delegateMethodNotImplementsTitle reason:err_delegateMethodNotImplementsContent userInfo:nil];
            } else {
                @throw [NSException exceptionWithName:err_delegateNotSetsTitle reason:err_delegateNotSetsContent userInfo:nil];
            }
        }
        default:
            break;
    }
}

@end
