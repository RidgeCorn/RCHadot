//
//  RCBot.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCBot.h"
#import <Routable.h>
#import <TMCache.h>

static RCBot *_sharedBot;

static dispatch_once_t onceToken;

@interface RCBot()

@property (nonatomic) NSMutableDictionary *tasks;

@end

@implementation RCBot

- (id)init {
    returnc(self,
            (self = [super init]) ? _tasks = [@{} mutableCopy] : 0;
            );
}

#pragma mark - Loyal Staff

+ (instancetype)sharedBot {
    returnc(_sharedBot,
            dispatch_once(&onceToken, ^{
        _sharedBot = [self newBot];
    }); );
}

#pragma mark - hiring Staff

+ (instancetype)newBot {
    returnc([[self alloc] init]);
}

#pragma mark - Start Task
- (BOOL)start:(NSString *)taskKey removeAfterDone:(BOOL)removeAfterDone {
    returnc(called,
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
                    @throw [NSException exceptionWithName:@"Required Method NOT implemented" reason:@"Required Method 'handleStart:' in protocol not implemented" userInfo:nil];
                }
                
                called = YES;
            }
            
            if(called && removeAfterDone) {
                [self remove:taskKey];
            } );
}

- (BOOL)start:(NSString *)taskKey {
//    NSLog(@"%@", taskKey);
    returnc([self start:taskKey removeAfterDone:NO]);
}

- (BOOL)record:(RCTask *)task {
    returnc(record,
            BOOL record = NO;
            
            if ( ![_tasks objectForKey:task.key]) {
                [_tasks setObject:task forKey:task.key];
                
                if ([task.delegate respondsToSelector:@selector(handleRecord:)]) {
                    [task.delegate handleRecord:task];
                }
                
                record = YES;
                
                task.state = RCTaskStateRecored;
            } );
}

- (void)remove:(NSString *)taskKey {
    RCTask *task = [_tasks objectForKey:taskKey];
    
    if ([task.delegate respondsToSelector:@selector(handleRemove:)]) {
        [task.delegate handleRemove:taskKey];
    }
    
    task = nil;
    
    [_tasks removeObjectForKey:taskKey];
}

- (id<RCTaskHandleDelegate>)taskForKey:(NSString *)taskKey {
    returnc([_tasks objectForKey:taskKey]);
}

@end
