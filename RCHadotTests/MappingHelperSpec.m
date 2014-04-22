//
//  RCMappingHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCMappingHelper.h"


SPEC_BEGIN(RCMappingHelperSpec)

describe(@"RCMappingHelper", ^{
    
    context(@"when add collection with key 'kRCModelUsers'", ^{
        it(@"should be done", ^{
            NSString *key = @"kRCModelUsers";
            NSMutableDictionary *collection = [@{@"key": @"value"} mutableCopy];
            [RCMappingHelper addCollection:collection withKey:key];
            
            [[[RCMappingHelper collectionForKey:key] should] equal:collection];
        });
    });
    
    context(@"when set value for key with collection key", ^{
        it(@"should be done", ^{
            NSString *key = @"userView.nameLabel.text";
            NSString *value = @"result.username";
            NSString *collectionKey = @"kRCModelUsers";
            [RCMappingHelper setValue:value forKey:key withCollectionKey:collectionKey];
            
            [[[RCMappingHelper valueForKey:key withCollectionKey:collectionKey] should] equal:value];
        });
    });
});

SPEC_END
