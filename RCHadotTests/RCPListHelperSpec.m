//
//  RCPListHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCPListHelper.h"


SPEC_BEGIN(RCPListHelperSpec)

describe(@"RCPListHelper", ^{
    context(@"when getting RCHadotTestsKey in RCPListHelperTests.plist", ^{
        it(@"should be RCHadotTestsValue", ^{
            [[[RCPListHelper objectInBundle:[NSBundle bundleForClass:[RCPListHelper class]] plist:@"RCPListHelperTests" withKey:@"RCHadotTestsKey"] should] equal:@"RCHadotTestsValue"];
        });
    });
    
    context(@"when getting RCHadotTestsKey in RCHadotTests-Info.plist", ^{
        xit(@"should be RCHadotTestsValue", ^{
            [[[RCPListHelper objectInBundle:[NSBundle bundleForClass:[RCPListHelper class]] plist:@"RCHadotTests-Info" withKey:@"RCHadotTestsKey"] should] equal:@"RCHadotTestsValue"];
        });
    });
});

SPEC_END
