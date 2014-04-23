//
//  RCLevelDBHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCLevelDBHelper.h"


SPEC_BEGIN(RCLevelDBHelperSpec)

describe(@"RCLevelDBHelper", ^{
    context(@"when test RCLDB", ^{
        it(@"should exist", ^{
            [[RCLDB should] beNonNil];
        });
    });
    
    context(@"when test setObject: 'string' forKey: 'key'", ^{
        it(@"should be done ", ^{
            NSString *object = @"string";
            NSString *key = @"key";
            
            [RCLDB setObject:object forKey:key];
            [[RCLDB should] beNonNil];
        });
    });
    
    context(@"when test objectForKey: 'key'", ^{
        it(@"should equal 'string' ", ^{
            NSString *object = @"string";
            NSString *key = @"key";
            
            [[[RCLDB objectForKey:key] should] equal:object];
        });
    });
    
    context(@"when test objectForKey: 'key'", ^{
        it(@"should not equal 'theNewString' ", ^{
            NSString *object = @"theNewString";
            NSString *key = @"key";
            
            [[[RCLDB objectForKey:key] shouldNot] equal:object];
        });
    });
});

SPEC_END
