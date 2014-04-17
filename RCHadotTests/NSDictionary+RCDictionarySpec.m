//
//  NSDictionary+RCDictionarySpec.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "NSDictionary+RCDictionary.h"


SPEC_BEGIN(NSDictionary_RCDictionarySpec)

describe(@"NSDictionary+RCDictionary", ^{
    context(@"when testing valueForDotKeyPath", ^{
        it(@"should be done", ^{
            NSString *value = @"looping";
            NSDictionary *dict = @{
                                   @"app":@{
                                           @"model": @{
                                                   @"user": @{
                                                           @"name": value
                                                           }
                                                   }
                                           }
                                   };
            [[[dict valueForDotKeyPath:@"app.model.user.name"] should] equal:value];
        });
    });
    
    context(@"when testing valueForKeyPath separatedString with dict object", ^{
        it(@"should be done", ^{
            NSString *value = @"looping";
            NSDictionary *dict = @{
                                   @"app":@{
                                           @"model": @{
                                                   @"user": @{
                                                           @"name": value
                                                           }
                                                   }
                                           }
                                   };
            [[[dict valueForKeyPath:@"app.model.user.name" separatedString:@"."] should] equal:value];
        });
    });
    
    context(@"when testing valueForKeyPath separatedString with object", ^{
        it(@"should be done", ^{
            NSString *value = @"looping";
            
            UILabel *userNameLabel = [UILabel new];
            userNameLabel.text = value;
            
            NSDictionary *dict = @{
                                   @"app.views":@{
                                           @"loginView": @{
                                                   @"userNameLabel": userNameLabel
                                                   }
                                           }
                                   };
            
            [[[dict valueForKeyPath:@"app.views/loginView/userNameLabel.text" separatedString:@"/"] should] equal:value];
        });
    });
    
    context(@"when testing valueForKeyPath separatedString with dict object", ^{
        it(@"should be done", ^{
            NSDictionary *dict = @{
                                   @"userName": @"looping",
                                   @"userPassword": @"123456",
                                   @"foo": @"bar",
                                   @"bar": @"baz"
                                   };
            
            NSDictionary *mapping = @{
                                  @"userName": @"name",
                                  @"userPassword": @"pwd"
                                   };
            
            NSDictionary *ans = @{
                                  @"name": @"looping",
                                  @"pwd": @"123456"
                                  };
            
            [[[dict filterWithMapping:mapping] should] equal:ans];
        });
    });
    
});

SPEC_END
