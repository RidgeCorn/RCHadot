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
            
            [[((RCJSONModelTest *)[RCModelHelper modelByClass:[RCJSONModelTest class] initWithDictionary:dict error:&err]).name should] equal:username];
            
            [[err should] beNil];
        });
    });
    
    context(@"when test modelClass 'RCMTLModelTest' initWithDictionary '@{@'name': @'looping'}' err", ^{
        it(@"should be done", ^{
            NSString *username = @"looping";
            NSDictionary *dict = @{@"username": username};
            NSError *err = nil;
            
            [[((RCMTLModelTest *)[RCModelHelper modelByClass:[RCMTLModelTest class] initWithDictionary:dict error:&err]).name should] equal:username];
            
            [[err should] beNil];
        });
    });
    
    context(@"when test modelsByClass 'RCJSONModelTest' initWithData '@[@{@'name': @'looping'}, ...]' err", ^{
        it(@"should be done", ^{
            NSString *username = @"looping";
            NSArray *arr = @[@{@"username": username}, @{@"username": username}, @{@"username": username}];
            NSError *err = nil;
            
            NSArray *models = [RCModelHelper modelsByClass:[RCJSONModelTest class] initWithArray:arr error:&err];
            
            [[err should] beNil];

            for (RCJSONModelTest *model in models) {
                [[model.name should] equal:username];
            }
            
        });
    });
    
    context(@"when test modelsByClass 'RCMTLModelTest' initWithData '@[@{@'name': @'looping'}, ...]' err", ^{
        it(@"should be done", ^{
            NSString *username = @"looping";
            NSArray *arr = @[@{@"username": username}, @{@"username": username}, @{@"username": username}];
            NSError *err = nil;
            
            NSArray *models = [RCModelHelper modelsByClass:[RCMTLModelTest class] initWithArray:arr error:&err];
            
            [[err should] beNil];
            
            for (RCMTLModelTest *model in models) {
                [[model.name should] equal:username];
            }
        });
    });
});

SPEC_END
