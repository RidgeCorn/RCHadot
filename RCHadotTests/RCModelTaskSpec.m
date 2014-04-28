//
//  RCModelTaskSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCModelTask.h"


SPEC_BEGIN(RCModelTaskSpec)

describe(@"RCModelTask", ^{
    context(@"when test initWithKey: 'key' type: 'RCModelTaskTypeLoadFromServerWithGet' requestPath: 'path' options: <options>", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            RCModelTaskOptions *options = [[RCModelTaskOptions alloc] init];
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath options:options];

            [[task should] beNonNil];
            [[task.key should] equal:key];
        });
    });
    
    context(@"when test setParamValue: 'param' withKey: 'key'", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            RCModelTaskOptions *options = [[RCModelTaskOptions alloc] init];
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath options:options];

            NSString *prama = @"prama";
            NSString *pramaKey = @"key";
            [task setParamValue:prama withKey:pramaKey];
            
            [[[task paramWithKey:pramaKey] should] equal:prama];
            [[[task.options.requestParams objectForKey:pramaKey] should] equal:prama];
        });
    });
    
    context(@"when test resetParams", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            RCModelTaskOptions *options = [[RCModelTaskOptions alloc] init];
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath options:options];

            NSString *prama = @"prama";
            NSString *pramaKey = @"key";
            [task setParamValue:prama withKey:pramaKey];
            
            [[[task paramWithKey:pramaKey] should] beNonNil];
            [[[task.options.requestParams objectForKey:pramaKey] should] beNonNil];
            [[@([task.options.requestParams count]) should] equal:@(1)];

            [task resetParams];
            
            [[[task paramWithKey:pramaKey] should] beNil];
            [[[task.options.requestParams objectForKey:pramaKey] should] beNil];
            [[@([task.options.requestParams count]) should] equal:@(0)];
        });
    });
});

SPEC_END
