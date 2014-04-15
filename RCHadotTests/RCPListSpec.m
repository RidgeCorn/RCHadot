//
//  RCPListSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCPList.h"


SPEC_BEGIN(RCPListSpec)

describe(@"RCPList", ^{
    context(@"when getting RCHadotTestsKey in RCPListTests.plist", ^{
        it(@"should be RCHadotTestsValue", ^{
            [[[RCPList objectInBundle:[NSBundle bundleForClass:[RCPList class]] plist:@"RCPListTests" withKey:@"RCHadotTestsKey"] should] equal:@"RCHadotTestsValue"];
        });
    });
    
    context(@"when getting RCHadotTestsKey in RCHadotTests-Info.plist", ^{
        it(@"should be RCHadotTestsValue", ^{
            [[[RCPList objectInBundle:[NSBundle bundleForClass:[RCPList class]] plist:@"RCHadotTests-Info" withKey:@"RCHadotTestsKey"] should] equal:@"RCHadotTestsValue"];
        });
    });
});

SPEC_END
