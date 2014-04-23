//
//  RCBotSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCBot.h"
#import "RCBotTaskTest.h"

SPEC_BEGIN(RCBotSpec)

describe(@"RCBot", ^{
    context(@"when calling sharedBot", ^{
        it(@"should exist", ^{
            [[Bot should] beNonNil];
        });
    });
    
    context(@"when calling newBot", ^{
        it(@"should exist", ^{
            [[[RCBot newBot] should] beNonNil];
        });
    });
    
    context(@"when calling newBot", ^{
        it(@"should not equal to sharedBot", ^{
            [[[RCBot newBot] shouldNot] equal:Bot];
        });
    });
    
    context(@"when record RCBotTaskTest with key 'taskKey'", ^{
        it(@"should exist", ^{
            NSString *taskKey = @"taskKey";
            RCBotTaskTest *testTask = [[RCBotTaskTest alloc] initWithKey:taskKey];
            [Bot record:testTask];

            [[(RCBotTaskTest *)[Bot taskForKey:taskKey] should] equal:testTask];
        });
    });
    
    context(@"when start RCBotTaskTest with key 'taskKey'", ^{
        it(@"should be done", ^{
            NSString *taskKey = @"taskKey";
            
            [[@([Bot start:taskKey]) should] equal:@(YES)];
            
            [[(RCBotTaskTest *)[Bot taskForKey:taskKey] shouldNot] beNil];
        });
    });
    
    context(@"when test allTaskKeys", ^{
        it(@"should equal @[taskKey]", ^{
            NSString *taskKey = @"taskKey";
            
            [[[Bot allTaskKeys] should] equal:@[taskKey]];
        });
    });
    
    context(@"when test allTasks", ^{
        it(@"should equal @[[Bot taskForKey:taskKey]]", ^{
            NSString *taskKey = @"taskKey";
            
            [[[Bot allTasks] should] equal:@[[Bot taskForKey:taskKey]]];
        });
    });

    context(@"when remove RCBotTaskTest with key 'taskKey'", ^{
        it(@"should be gone", ^{
            NSString *taskKey = @"taskKey";
            [Bot remove:taskKey];
            
            [[(RCBotTaskTest *)[Bot taskForKey:taskKey] should] beNil];
        });
    });
    
    context(@"when start RCBotTaskTest with key 'taskKey' removeAfterDone", ^{
        it(@"should be gone", ^{
            NSString *taskKey = @"taskKey";
            RCBotTaskTest *testTask = [[RCBotTaskTest alloc] initWithKey:taskKey];
            [Bot record:testTask];
            
            [[(RCBotTaskTest *)[Bot taskForKey:taskKey] should] equal:testTask];
            
            [[@([Bot start:taskKey removeAfterDone:YES]) should] equal:@(YES)];

            [[(RCBotTaskTest *)[Bot taskForKey:taskKey] shouldEventually] beNil];
        });
    });
});

SPEC_END
