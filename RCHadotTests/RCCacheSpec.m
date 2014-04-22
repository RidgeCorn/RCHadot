//
//  RCCacheSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCCache.h"


SPEC_BEGIN(RCCacheSpec)

describe(@"RCCache", ^{
    context(@"when calling sharedCache", ^{
        it(@"should exist", ^{
            [[Cache should] beNonNil];
        });
    });
    
    context(@"when setObject 'string' forKey 'key'", ^{
        it(@"should exist", ^{
            NSString *object = @"string";
            NSString *key = @"key";
            [Cache setObject:object forKey:key];
            [[[Cache objectForKey:key] should] equal:object];
        });
    });
    
    context(@"when removeObjectForKey 'key'", ^{
        it(@"should be done", ^{
            NSString *key = @"key";

            [[[Cache objectForKey:key] should] beNonNil];
            
            [Cache removeObjectForKey:key];
            
            [[[Cache objectForKey:key] should] beNil];
        });
    });
});

SPEC_END
