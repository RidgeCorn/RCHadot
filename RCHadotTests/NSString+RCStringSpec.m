//
//  NSString+RCStringSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSString+RCString.h"


SPEC_BEGIN(NSString_RCStringSpec)

describe(@"NSString+RCString", ^{
    context(@"when test md5HexDigest with 'RCHadot'", ^{
        it(@"should equal '44fbf64a975c6f910da206136093b065'", ^{
            NSString *RCHadot = @"RCHadot";
            NSString *retString = @"44fbf64a975c6f910da206136093b065";
            
            [[[RCHadot md5HexDigest] should] equal:retString];
        });
    });
    
    context(@"when test hashString with 'RCHadot'", ^{
        it(@"should exist", ^{
            NSString *RCHadot = @"RCHadot";
            
            [[[RCHadot hashString] should] beNonNil];
        });
    });
    
    context(@"when test stringByTrimmingWhitespace with ' RCHadot  '", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *RCHadot = @" RCHadot  ";
            NSString *retString = @"RCHadot";
            
            [[[RCHadot stringByTrimmingWhitespace] should] equal:retString];
        });
    });
    
    context(@"when test stringByTrimmingWhitespaceAndNewline with ' RCHadot  \n\n '", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *RCHadot = @" RCHadot  \n\n ";
            NSString *retString = @"RCHadot";
            
            [[[RCHadot stringByTrimmingWhitespaceAndNewline] should] equal:retString];
        });
    });

    context(@"when test stringByAppendingString: 'RCHadot' withSepatator: '.'", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *string = @"test";
            NSString *aString = @"RCHadot";
            NSString *sString = @".";
            NSString *retString = @"test.RCHadot";

            [[[string stringByAppendingString:aString withSeparator:sString] should] equal:retString];
        });
    });
    
    context(@"when test stringByAppendingString: 'RCHadot' withSepatator: ''", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *string = @"test";
            NSString *aString = @"RCHadot";
            NSString *sString = @"";
            NSString *retString = @"testRCHadot";
            
            [[[string stringByAppendingString:aString withSeparator:sString] should] equal:retString];
        });
    });
    
    context(@"when test stringByAppendingString: 'RCHadot' withSepatator: (null)", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *string = @"test";
            NSString *aString = @"RCHadot";
            NSString *sString = nil;
            NSString *retString = @"testRCHadot";
            
            [[[string stringByAppendingString:aString withSeparator:sString] should] equal:retString];
        });
    });
    
    context(@"when test stringByAppendingString: (null) withSepatator: '.'", ^{
        it(@"should equal 'RCHadot'", ^{
            NSString *string = @"test";
            NSString *aString = nil;
            NSString *sString = @".";
            NSString *retString = @"test";
            
            [[[string stringByAppendingString:aString withSeparator:sString] should] equal:retString];
        });
    });
});

SPEC_END
