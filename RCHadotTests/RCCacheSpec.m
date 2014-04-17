//
//  RCCacheSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCCache.h"

SPEC_BEGIN(RCCacheSpec)

describe(@"RCCache", ^{
    context(@"when testing dictInCacheWithCachePaths", ^{
        it(@"should be done", ^{
            NSDictionary *users = @{
                                    @"user0": @{
                                            @"name": @"looping",
                                            @"email": @"www.looping@gmail.com"
                                            },
                                    @"user1": @{
                                            @"name": @"ridgecorn",
                                            @"email": @"contact@ridgecorn.com"
                                            }
                                    };
            [Cache setObject:users forKey:@"users"];

            NSDictionary *posts = @{
                                    @"post0": @{
                                            @"content": @"Nice work!",
                                            @"date": @"1397628298",
                                            },
                                    @"post1": @{
                                            @"content": @"We are hiring!",
                                            @"date": @"1397628298",
                                            }
                                    };
            [Cache setObject:posts forKey:@"posts"];

            NSString *appName = @"RCHadot";
            [Cache setObject:appName forKey:@"appName"];

            NSDictionary *resDict = @{
                                      @"appName": @"RCHadot",
                                      @"post0.content": @"Nice work!",
                                      @"user0.name": @"looping"
                                      };

            [[[RCCache dictInCacheWithCachePaths:@[@"appName.", @"users..user0.name", @"posts..post0.content"]] should] equal:resDict];
        });
    });
});

SPEC_END
