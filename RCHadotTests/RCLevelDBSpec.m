//
//  RCLevelDBSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCLevelDB.h"


SPEC_BEGIN(RCLevelDBSpec)

describe(@"RCLevelDB", ^{
    context(@"when test sharedLevelDBWithName: 'test.ldb'", ^{
        it(@"should exist", ^{
            NSString *DBFileName = @"test.ldb";
            [[[RCLevelDB sharedLevelDBWithName:DBFileName] should] beNonNil];
        });
    });
    
    context(@"when test sharedLevelDBWithName: ''", ^{
        xit(@"should exist", ^{
            NSString *DBFileName = @"";
            [[[RCLevelDB sharedLevelDBWithName:DBFileName] should] beNonNil];
        });
    });
    
    context(@"when test sharedLevelDBWithName: <nil>", ^{
        xit(@"should exist", ^{
            NSString *DBFileName = nil;
            [[[RCLevelDB sharedLevelDBWithName:DBFileName] should] beNonNil];
        });
    });
});

SPEC_END
