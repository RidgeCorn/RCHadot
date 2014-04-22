//
//  RCTaskSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCTask.h"


SPEC_BEGIN(RCTaskSpec)

describe(@"RCTask", ^{
    context(@"when test initWithKey: 'taskKey'", ^{
        it(@"should be exist", ^{
            NSString *taskKey = @"taskKey";
            RCTask *task = [[RCTask alloc] initWithKey:taskKey];
            
            [[task should] beNonNil];
            
            [[task.key should] equal:taskKey];
        });
    });
    
    context(@"when archive RCTask object", ^{
        it(@"should be done", ^{
            NSString *taskKey = @"taskKey";
            RCTask *task = [[RCTask alloc] initWithKey:taskKey];
            NSString *Path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSString *filename = [Path stringByAppendingPathComponent:@"testTask.archive"];

            [NSKeyedArchiver archiveRootObject:task toFile:filename];

            RCTask *retTask = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];

            [[retTask.key should] equal:task.key];
        });
    });
});

SPEC_END
