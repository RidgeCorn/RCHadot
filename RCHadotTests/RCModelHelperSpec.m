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
#import <Mantle.h>
#import "RCJSONModelTest.h"
#import "RCMTLModelTest.h"

SPEC_BEGIN(RCModelHelperSpec)

describe(@"RCModelHelper", ^{
    context(@"when test setModelObject 'NSString' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSString *model = @"modelCache";
            
            [RCModelHelper cacheModel:model forKey:model];
            
            [[[RCModelHelper modelForCacheKey:model] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'NSArray' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            NSArray *model = @[];
            NSString *key = @"modelCache";
            
            [RCModelHelper cacheModel:model forKey:key];
            
            [[[RCModelHelper modelForCacheKey:key] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'RCJSONModelTest' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            RCJSONModelTest *model = [[RCJSONModelTest alloc] init];
            NSString *key = @"modelCache";
            
            [RCModelHelper cacheModel:model forKey:key];
            
            [[[RCModelHelper modelForCacheKey:key] should] equal:model];
        });
    });
    
    context(@"when test setModelObject 'RCMTLModelTest' forKey 'modelCache'", ^{
        it(@"should be done", ^{
            RCMTLModelTest *model = [[RCMTLModelTest alloc] init];
            NSString *key = @"modelCache";
            
            [RCModelHelper cacheModel:model forKey:key];
            
            [[[RCModelHelper modelForCacheKey:key] should] equal:model];
        });
    });
    
    context(@"when test modelClass 'RCJSONModelTest' initWithDictionary '@{@'name': @'looping'}' err", ^{
        it(@"should be done", ^{
            NSString *username = @"looping";
            NSDictionary *dict = @{@"username": username};
            NSError *err = nil;
            
            [[((RCJSONModelTest *)[RCModelHelper modelClass:[RCJSONModelTest class] initWithDictionary:dict error:&err]).name should] equal:username];
            
            [[err should] beNil];
        });
    });
    
    context(@"when test modelClass 'RCMTLModelTest' initWithDictionary '@{@'name': @'looping'}' err", ^{
        it(@"should be done", ^{
            NSString *username = @"looping";
            NSDictionary *dict = @{@"username": username};
            NSError *err = nil;
            
            [[((RCMTLModelTest *)[RCModelHelper modelClass:[RCMTLModelTest class] initWithDictionary:dict error:&err]).name should] equal:username];
            
            [[err should] beNil];
        });
    });
});

SPEC_END
