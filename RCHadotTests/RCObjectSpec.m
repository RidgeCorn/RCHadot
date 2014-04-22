//
//  RCObjectSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCObject.h"


SPEC_BEGIN(RCObjectSpec)

describe(@"RCObject", ^{
    context(@"when new RCObject", ^{
        it(@"should exist", ^{
            [[[RCObject new] should] beNonNil];
        });
    });
    
    context(@"when alloc init RCObject", ^{
        it(@"should exist", ^{
            [[[[RCObject alloc] init] should] beNonNil];
        });
    });
});

SPEC_END
