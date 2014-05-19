//
//  RCControllerTaskSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCControllerTask.h"


SPEC_BEGIN(RCControllerTaskSpec)

describe(@"RCControllerTask", ^{
    context(@"test initWithKey: 'key' type: 'RCControllerTaskTypeOpen' navigationController: <UINavigationController> controllerClass: <UIViewController class> options: <options>", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCControllerTaskType type = RCControllerTaskTypeOpen;
            RCControllerTaskOptions *options = [[RCControllerTaskOptions alloc] init];
            UINavigationController *navigationController = [UINavigationController new];
            Class cls = [UIViewController class];
            
            RCControllerTask *task = [[RCControllerTask alloc] initWithKey:key Type:type navigationController:navigationController controllerClass:cls options:options];
            
            [[task should] beNonNil];
            [[task.key should] equal:key];
        });
    });
    
    context(@"when test - (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock;", ^{
        it(@"should be done", ^{
            NSString *key = @"key";
            
            __block NSString *value = @"";
            NSString *theValue = @"value";
            
            RCControllerTask *task = [[RCControllerTask alloc] initWithKey:key runBlock:^(id<RCTaskHandleDelegate> task_b) {
                value = @"value";
            }];
            
            [[value should] equal:@""];
            
            [Bot record:task];
            
            [Bot startTask:task];
            
            [[value should] equal:theValue];
        });
    });
});

SPEC_END
