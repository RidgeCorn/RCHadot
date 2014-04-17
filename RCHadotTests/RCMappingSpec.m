//
//  RCMappingSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCMapping.h"


SPEC_BEGIN(RCMappingSpec)

describe(@"RCMapping", ^{
    context(@"when call sharedMapping", ^{
        it(@"should not be nil", ^{
            [[Mapping should] beNonNil];
        });
    });
    
    context(@"when add collection with key 'kRCModelUsers'", ^{
        it(@"should be done", ^{
            NSString *key = @"kRCModelUsers";
            NSMutableDictionary *collection = [@{@"key": @"value"} mutableCopy];
            [Mapping addCollection:collection withKey:key];
            
            [[[Mapping collectionForKey:key] should] equal:collection];
        });
    });
    
    context(@"when set value for key with collection key", ^{
        it(@"should be done", ^{
            NSString *key = @"userView.nameLabel.text";
            NSString *value = @"result.username";
            NSString *collectionKey = @"kRCModelUsers";
            [Mapping setValue:value forKey:key withCollectionKey:collectionKey];
            
            [[[Mapping valueForKey:key withCollectionKey:collectionKey] should] equal:value];
        });
    });
});

SPEC_END
