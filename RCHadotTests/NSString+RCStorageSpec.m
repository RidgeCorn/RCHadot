//
//  NSString+RCStorageSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSString+RCStorage.h"


SPEC_BEGIN(NSString_RCStorageSpec)

describe(@"NSString+RCStorage", ^{
    context(@"when test convertFromUnderscoreCaseToCamelCase 'you_1_are_2_so_3_cute_4'", ^{
        it(@"should equal 'you1Are2So3Cute4'", ^{
            NSString *string = @"you_1_are_2_so_3_cute_4";
            NSString *retString = @"you1Are2So3Cute4";
            NSString *theNewString = [string convertFromUnderscoreCaseToCamelCase];
            
            [[theNewString should] equal:retString];
        });
    });
    
    context(@"when test convertFromCamelCaseToUnderscoreCase 'you1Are2So3Cute4'", ^{
        it(@"should equal 'you1Are2So3Cute4'", ^{
            NSString *string = @"you1Are2So3Cute4";
            NSString *retString = @"you_1_are_2_so_3_cute_4";
            NSString *theNewString = [string convertFromCamelCaseToUnderscoreCase];
            
            [[theNewString should] equal:retString];
        });
    });
    
    
    context(@"when testing keyPrefixForString 'stringKey'", ^{
        it(@"should equal '__stringKey_(managedByRCHadot)_stringKey'", ^{
            NSString *key = @"stringKey";
            NSString *retKey = @"__stringKey_(managedByRCHadot)_stringKey";
            
            [[[key addKeyPrefixForString:key] should] equal:retKey];
        });
    });
    
    context(@"when testing keyPrefixForClass 'NSString'", ^{
        it(@"should equal '____NSCFConstantString_(managedByRCHadot)_stringKey'", ^{
            NSString *key = @"stringKey";
            NSString *retKey = @"____NSCFConstantString_(managedByRCHadot)_stringKey";
            
            [[[key addKeyPrefixForClass:key.class] should] equal:retKey];
        });
    });
});

SPEC_END
