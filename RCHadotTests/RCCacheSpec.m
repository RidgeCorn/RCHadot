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
    
    context(@"when testing dictInCacheWithCachePaths", ^{
        it(@"should be done", ^{
            NSDictionary *users = @{
                                    @"users": @[@{
                                                    @"name": @"looping",
                                                    @"email": @"www.looping@gmail.com"
                                                    },
                                                @{
                                                    @"name": @"ridgecorn",
                                                    @"email": @"contact@ridgecorn.com"
                                                    }]
                                    };
            [Cache setObject:users forKey:@"users"];
            
            NSDictionary *posts = @{
                                    @"posts": @[@{
                                                    @"content": @"Nice work!",
                                                    @"date": @"1397628298",
                                                    },
                                                @{
                                                    @"content": @"We are hiring!",
                                                    @"date": @"1397628298",
                                                    }]
                                    };
            [Cache setObject:posts forKey:@"posts"];
            
            NSString *appName = @"RCHadot";
            [Cache setObject:appName forKey:@"appName"];
            
            NSDictionary *resDict = @{
                                      @"appName": @"RCHadot",
                                      @"posts.@0.content": @"Nice work!",
                                      @"users.@0.name": @"looping"
                                      };
            
            [[[RCCache dictInCacheWithCachePaths:@[@"appName.", @"users..users.@0.name", @"posts..posts.@0.content"]] should] equal:resDict];
        });
    });

    context(@"when testing setObject 'string'(NSString) forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSString *string = @"string";
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCache setObject:string forKey:key withType:type];
            
            [[[Cache objectForKey:key] should] equal:string];
        });
    });

    context(@"when testing setObject '@[@'a', @'b']'(NSArray) forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSArray *array = @[@"a", @"b"];
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCache setObject:array forKey:key withType:type];
            
            [[[Cache objectForKey:key] should] equal:array];
        });
    });
    
    context(@"when testing setObject '@[@'c', @'d']'(NSArray) forKey 'key' withType 'RCModelOptionsStorageTypeAppend'", ^{
        it(@"should be done", ^{
            NSArray *array = @[@"c", @"d"];
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeAppend;
            NSArray *theNewArray = @[@"a", @"b", @"c", @"d"];
            
            [RCCache setObject:array forKey:key withType:type];

            [[[Cache objectForKey:key] should] equal:theNewArray];
        });
    });
    
    context(@"when testing setObject '@{@'key':@'value'}' forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSDictionary *dict = @{@"key":@"value"};
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCache setObject:dict forKey:key withType:type];
            
            [[[Cache objectForKey:key] should] equal:dict];
        });
    });
    
    context(@"when testing setObject '@{@'newKey':@'newValue'}' forKey 'key' withType 'RCModelOptionsStorageTypeAppend'", ^{
        it(@"should be done", ^{
            NSDictionary *dict = @{@"newKey":@"newValue"};
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeAppend;
            NSDictionary *theNewDict = @{@"key":@"value", @"newKey":@"newValue"};
            
            [RCCache setObject:dict forKey:key withType:type];

            [[[Cache objectForKey:key] should] equal:theNewDict];
        });
    });
});

SPEC_END
