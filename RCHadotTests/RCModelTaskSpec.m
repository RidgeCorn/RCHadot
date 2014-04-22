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
    context(@"test initWithKey: 'key' type: 'RCModelTaskTypeLoadFromServerWithGet' requestPath: 'path' options: <options>", ^{
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
});

SPEC_END
