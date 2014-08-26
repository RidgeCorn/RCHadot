//
//  RCModelTaskSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCModelTask.h"
#import "JSONModel.h"


SPEC_BEGIN(RCModelTaskSpec)

describe(@"RCModelTask", ^{
    context(@"when test initWithKey: 'key' type: 'RCModelTaskTypeLoadFromServerWithGet' requestPath: 'path' options: <options>", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];

            [[task should] beNonNil];
            [[task.key should] equal:key];
        });
    });
    
    context(@"when test setParam: 'param' withKey: 'key'", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];

            NSString *prama = @"prama";
            NSString *pramaKey = @"key";
            [task setParam:prama withKey:pramaKey];
            
            [[[task paramWithKey:pramaKey] should] equal:prama];
            [[[task.requestParams objectForKey:pramaKey] should] equal:prama];
        });
    });
    
    context(@"when test removeParamForKey: 'key'", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];
            
            NSString *prama = @"prama";
            NSString *pramaKey = @"key";
            [task setParam:prama withKey:pramaKey];
            
            [[[task paramWithKey:pramaKey] should] equal:prama];
            [[[task.requestParams objectForKey:pramaKey] should] equal:prama];
            
            [task removeParamWithKey:key];
            
            [[[task paramWithKey:pramaKey] should] beNil];
            [[[task.requestParams objectForKey:pramaKey] should] beNil];
        });
    });
    
    context(@"when test resetParams", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];

            NSString *prama = @"prama";
            NSString *pramaKey = @"key";
            [task setParam:prama withKey:pramaKey];
            
            [[[task paramWithKey:pramaKey] should] beNonNil];
            [[[task.requestParams objectForKey:pramaKey] should] beNonNil];
            [[@([task.requestParams count]) should] equal:@(1)];

            [task resetParams];
            
            [[[task paramWithKey:pramaKey] should] beNil];
            [[[task.requestParams objectForKey:pramaKey] should] beNil];
            [[@([task.requestParams count]) should] equal:@(0)];
        });
    });
    
    context(@"when test setModelClass: 'RCJSONModel' withKey: 'key'", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];
            
            Class cls = [JSONModel class];
            NSString *modelKey = @"key";
            [task setModelClass:cls withResponsKey:modelKey];
            
            [[[task modelClassWithKey:modelKey] should] equal:cls];
        });
    });
    
    context(@"when test removeModelClassWithKey: 'key'", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];
            
            Class cls = [JSONModel class];
            NSString *modelKey = @"key";
            [task setModelClass:cls withResponsKey:modelKey];
            
            [[[task modelClassWithKey:modelKey] should] equal:cls];
            
            [task removeModelClassWithKey:key];
            
            [[[task modelClassWithKey:modelKey] should] beNil];
            [[[task.modelsMapping objectForKey:modelKey] should] beNil];
        });
    });
    
    context(@"when test resetParams", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            RCModelTaskType type = RCModelTaskTypeLoadFromServerWithGet;
            NSString *requestPath = @"path";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key type:type requestPath:requestPath];
            
            Class cls = [JSONModel class];
            NSString *modelKey = @"key";
            [task setModelClass:cls withResponsKey:modelKey];
            
            [[[task modelClassWithKey:modelKey] should] equal:cls];
            [[@([task.modelsMapping count]) should] equal:@(1)];
            
            [task resetModels];
            
            [[[task modelClassWithKey:modelKey] should] beNil];
            [[[task.modelsMapping objectForKey:modelKey] should] beNil];
            [[@([task.modelsMapping count]) should] equal:@(0)];
        });
    });
    
    context(@"when test - (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock;", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            
            __block NSString *value = @"";
            NSString *theValue = @"value";
            
            RCModelTask *task = [[RCModelTask alloc] initWithKey:key runBlock:^(id<RCTaskHandleDelegate> task_b) {
                value = @"value";
            }];
            
            [[value should] equal:@""];
            
            [Bot startTask:task];
            
            [[value should] equal:theValue];
        });
    });
});

SPEC_END
