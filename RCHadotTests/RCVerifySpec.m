//
//  RCVerifySpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCVerify.h"


SPEC_BEGIN(RCVerifySpec)

describe(@"RCVerify", ^{
    context(@"when testing nil string using isDataNil", ^{
        it(@"should return YES", ^{
            NSString *string = nil;
            [[@([RCVerify isDataNil:string]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing empty string using isDataNil", ^{
        it(@"should return NO", ^{
            NSString *string = @"";
            [[@([RCVerify isDataNil:string]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing string using isDataNil", ^{
        it(@"should return NO", ^{
            NSString *string = @"string";
            [[@([RCVerify isDataNil:string]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing float 0.01 using isFloatZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerify isFloatZero:0.01]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing float 0.0000001 using isFloatZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerify isFloatZero:0.0000001]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing float -12345 using isFloatZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerify isFloatZero:-12345]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing string 0.01 using isDataZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerify isDataZero:[@(0.01) stringValue]]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing string 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerify isDataZero:[@(0.0000001) stringValue]]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing string -12345 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerify isDataZero:[@(-12345) stringValue]]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing number 0.01 using isDataZero", ^{
        it(@"should return NO", ^{
            [[@([RCVerify isDataZero:@(0.01)]) should] equal:@(NO)];
        });
    });
    
    context(@"when testing number 0.0000001 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerify isDataZero:@(0.0000001)]) should] equal:@(YES)];
        });
    });
    
    context(@"when testing number -12345 using isDataZero", ^{
        it(@"should return YES", ^{
            [[@([RCVerify isDataZero:@(-12345)]) should] equal:@(NO)];
        });
    });
});

SPEC_END
