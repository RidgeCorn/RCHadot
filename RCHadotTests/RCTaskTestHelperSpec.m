//
//  RCTaskTestHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCTaskTestHelper.h"
#import "RCBotTaskTest.h"

SPEC_BEGIN(RCTaskTestHelperSpec)

describe(@"TaskTestHelper", ^{
    
    context(@"when test runAllTasksForClass: <RCBotTaskTest class>", ^{
        it(@"should be done", ^{
            NSString *taskKey = @"taskKey";
            RCBotTaskTest *testTask = [[RCBotTaskTest alloc] initWithKey:taskKey];
            
            [Bot record:testTask];
            
            [[@([RCTaskTestHelper runAllTasksForClass:[RCBotTaskTest class]]) should] equal:@(YES)];
        });
    });
    
    context(@"when test runAllTasks", ^{
        it(@"should be done", ^{
            [[@([RCTaskTestHelper runAllTasks]) should] equal:@(YES)];
        });
    });
    
});

SPEC_END
