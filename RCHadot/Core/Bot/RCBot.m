//
//  RCBot.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCBot.h"
#import "RCCacheHelper.h"
#import <Routable.h>
#import "RCStyleSheetsHelper.h"

static RCBot *_sharedBot;

static dispatch_once_t onceToken;

@interface RCBot()

@end

@implementation RCBot

#pragma mark - Init Bot

+ (instancetype)sharedBot {
    returnc(_sharedBot,
            dispatch_once(&onceToken, ^{
        _sharedBot = [self newBot];
    }); );
}

#pragma mark New Bot

+ (instancetype)newBot {
    returnc([[self alloc] init]);
}

#pragma mark - Start Task
- (BOOL)start:(NSString *)key removeAfterDone:(BOOL)removeAfterDone {
    returnc(called,
            BOOL called = NO;
            RCTask *task = nil;
            NSString *taskKey = key ? [[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString:key] : nil;
            
            if (taskKey) {
                task = [Cache objectForKey:taskKey];
            }
            
            if (task) {
                task.state = RCTaskStateStart;
                
                if ([task.delegate respondsToSelector:@selector(handleStart:)]) {
                    [task.delegate handleStart:key];
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
    returnc([self start:taskKey removeAfterDone:NO]);
}

- (BOOL)record:(RCTask *)task {
    returnc(record,
            BOOL record = NO;
            NSString *taskKey = task.key ? [[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString:task.key] : nil;

            if ( !([Cache objectForKey:taskKey] && [[Cache objectForKey:taskKey] isEqual:task])) {
                [Cache setObject:task forKey:taskKey];
                
                if ([task.delegate respondsToSelector:@selector(handleRecord:)]) {
                    [task.delegate handleRecord:task];
                }
                
                record = YES;
                
                task.state = RCTaskStateRecored;
            } );
}

- (void)remove:(NSString *)key {
    NSString *taskKey = key ? [[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString:key] : nil;

    RCTask *task = [Cache objectForKey:taskKey];
    
    if ([task.delegate respondsToSelector:@selector(handleRemove:)]) {
        [task.delegate handleRemove:taskKey];
    }
    
    task = nil;
    
    [Cache removeObjectForKey:taskKey];
}

- (id)taskForKey:(NSString *)key {
    NSString *taskKey = key ? [[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString:key] : nil;

    returnc([Cache objectForKey:taskKey]);
}

@end
