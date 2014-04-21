//
//  RCModelCacheSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright 2014年 RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCModelCache.h"
#import <JSONModel.h>

SPEC_BEGIN(RCModelCacheSpec)

describe(@"RCModelCache", ^{
    context(@"when test setModelObject 'NSString' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSString *model = @"modelCache";
            
            [ModelCache setModelObject:model forKey:model];
            
            [[[ModelCache modelForKey:model] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'NSArray' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSArray *model = @[];
            NSString *key = @"modelCache";
            
            [ModelCache setModelObject:model forKey:key];
            
            [[[ModelCache modelForKey:key] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'JSONModel' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            JSONModel *model = [[JSONModel alloc] init];
            NSString *key = @"modelCache";
            
            [ModelCache setModelObject:model forKey:key];
            
            [[[ModelCache modelForKey:key] should] equal:model];
        });
    });
});

SPEC_END
