//
//  RCModelHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCModelHelper.h"
#import <JSONModel.h>

SPEC_BEGIN(RCModelHelperSpec)

describe(@"RCModelHelper", ^{
    context(@"when test setModelObject 'NSString' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSString *model = @"modelCache";
            
            [ModelHelper cacheModel:model forKey:model];
            
            [[[ModelHelper modelForCacheKey:model] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'NSArray' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSArray *model = @[];
            NSString *key = @"modelCache";
            
            [ModelHelper cacheModel:model forKey:key];
            
            [[[ModelHelper modelForCacheKey:key] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'JSONModel' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            JSONModel *model = [[JSONModel alloc] init];
            NSString *key = @"modelCache";
            
            [ModelHelper cacheModel:model forKey:key];
            
            [[[ModelHelper modelForCacheKey:key] should] equal:model];
        });
    });
});

SPEC_END
