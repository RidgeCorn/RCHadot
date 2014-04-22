//
//  RCViewTaskSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCViewTask.h"


SPEC_BEGIN(RCViewTaskSpec)

describe(@"RCViewTask", ^{
    context(@"test initWithKey: 'key' type: 'RCViewTaskTypeAddToView' refsView: <UIView> viewClass: <UILabel class> options: <options>", ^{
        it(@"should exist", ^{
            NSString *key = @"key";
            RCViewTaskType type = RCViewTaskTypeAddToView;
            RCViewTaskOptions *options = [[RCViewTaskOptions alloc] init];
            UIView *refsView = [UIView new];
            Class cls = [UILabel class];
            
            RCViewTask *task = [[RCViewTask alloc] initWithKey:key Type:type refsView:refsView viewClass:cls options:options];
            
            [[task should] beNonNil];
            [[task.key should] equal:key];
        });
    });
});

SPEC_END
