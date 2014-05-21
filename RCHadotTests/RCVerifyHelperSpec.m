//
//  RCVerifyHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCVerifyHelper.h"


SPEC_BEGIN(RCVerifyHelperSpec)

describe(@"RCVerifyHelper", ^{
    context(@"when testing nil string using isDataNil", ^{
        it(@"should return YES", ^{
            NSString *string = nil;
            [[@([RCVerifyHelper isDataNil:string]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing [NSNull null] using isDataNil", ^{
        it(@"should return YES", ^{
            id string = [NSNull null];
            [[@([RCVerifyHelper isDataNil:string]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing empty string using isDataNil", ^{
        it(@"should return NO", ^{
            NSString *string = @"";
            [[@([RCVerifyHelper isDataNil:string]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing string using isDataNil", ^{
        it(@"should return NO", ^{
            NSString *string = @"string";
            [[@([RCVerifyHelper isDataNil:string]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing float 0.0 using isFloatZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isFloatZero:0.0]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing float 0.01 using isFloatZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerifyHelper isFloatZero:0.01]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing float 0.0000001 using isFloatZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isFloatZero:0.0000001]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing float -0.0000001 using isFloatZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isFloatZero: -0.0000001]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing float -12345 using isFloatZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerifyHelper isFloatZero:-12345]) should] equal:@(NO)];
        });
    });

    context(@"when testing string 0.0 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:[@(0.0) stringValue]]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing string 0.01 using isDataZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerifyHelper isDataZero:[@(0.01) stringValue]]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing string 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:[@(0.0000001) stringValue]]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing string 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:[@(-0.0000001) stringValue]]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing string -12345 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:[@(-12345) stringValue]]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing NSNumber @0.0 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:@(0.0)]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing NSNumber 0.01 using isDataZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerifyHelper isDataZero:@(0.01)]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing NSNumber 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:@(0.0000001)]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing NSNumber 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:@(-0.0000001)]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing NSNumber -12345 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerifyHelper isDataZero:@(-12345)]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing nil using safeData", ^{
        it(@"should equal to empty string", ^{
            NSString *string = nil;
            [[[RCVerifyHelper safeData:string] should] equal:@""];
        });
    });
    
    context(@"when testing [NSNull null] using safeData", ^{
        it(@"should equal to empty string", ^{
            id string = [NSNull null];
            [[[RCVerifyHelper safeData:string] should] equal:@""];
        });
    });
    
    context(@"when testing string 'string' using safeData", ^{
        it(@"should equal to 'string'", ^{
            NSString *string = @"string";
            [[[RCVerifyHelper safeData:string] should] equal:@"string"];
        });
    });
    
    context(@"when testing array @[@'string'] using safeData", ^{
        it(@"should equal to @[@'string']", ^{
            NSArray *string = @[@"string"];
            [[[RCVerifyHelper safeData:string] should] equal:@[@"string"]];
        });
    });
});

SPEC_END
