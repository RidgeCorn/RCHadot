//
//  RCCacheHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-15.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCCacheHelper.h"

SPEC_BEGIN(RCCacheHelperSpec)

describe(@"RCCacheHelper", ^{
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
            [RCCacheHelper setObject:users forKey:@"users"];

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
            [RCCacheHelper setObject:posts forKey:@"posts"];

            NSString *appName = @"RCHadot";
            [RCCacheHelper setObject:appName forKey:@"appName"];

            NSDictionary *resDict = @{
                                      @"appName": @"RCHadot",
                                      @"post0.content": @"Nice work!",
                                      @"user0.name": @"looping"
                                      };

            [[[RCCacheHelper dictInCacheWithCachePaths:@[@"appName.", @"users..user0.name", @"posts..post0.content"]] should] equal:resDict];
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
            [RCCacheHelper setObject:users forKey:@"users"];
            
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
            [RCCacheHelper setObject:posts forKey:@"posts"];
            
            NSString *appName = @"RCHadot";
            [RCCacheHelper setObject:appName forKey:@"appName"];
            
            NSDictionary *resDict = @{
                                      @"appName": @"RCHadot",
                                      @"posts.@0.content": @"Nice work!",
                                      @"users.@0.name": @"looping"
                                      };
            
            [[[RCCacheHelper dictInCacheWithCachePaths:@[@"appName.", @"users..users.@0.name", @"posts..posts.@0.content"]] should] equal:resDict];
        });
    });

    context(@"when testing setObject 'string'(NSString) forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSString *string = @"string";
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCacheHelper setObject:string forKey:key withType:type];
            
            [[[RCCacheHelper objectForKey:key] should] equal:string];
        });
    });

    context(@"when testing setObject '@[@'a', @'b']'(NSArray) forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSArray *array = @[@"a", @"b"];
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCacheHelper setObject:array forKey:key withType:type];
            
            [[[RCCacheHelper objectForKey:key] should] equal:array];
        });
    });
    
    context(@"when testing setObject '@[@'c', @'d']'(NSArray) forKey 'key' withType 'RCModelOptionsStorageTypeAppend'", ^{
        it(@"should be done", ^{
            NSArray *array = @[@"c", @"d"];
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeAppend;
            NSArray *theNewArray = @[@"a", @"b", @"c", @"d"];
            
            [RCCacheHelper setObject:array forKey:key withType:type];

            [[[RCCacheHelper objectForKey:key] should] equal:theNewArray];
        });
    });
    
    context(@"when testing setObject '@{@'key':@'value'}' forKey 'key' withType 'RCModelOptionsStorageTypeWrite'", ^{
        it(@"should be done", ^{
            NSDictionary *dict = @{@"key":@"value"};
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeWrite;
            
            [RCCacheHelper setObject:dict forKey:key withType:type];
            
            [[[RCCacheHelper objectForKey:key] should] equal:dict];
        });
    });
    
    context(@"when testing setObject '@{@'newKey':@'newValue'}' forKey 'key' withType 'RCModelOptionsStorageTypeAppend'", ^{
        it(@"should be done", ^{
            NSDictionary *dict = @{@"newKey":@"newValue"};
            NSString *key = @"key";
            RCModelOptionsStorageType type = RCModelOptionsStorageTypeAppend;
            NSDictionary *theNewDict = @{@"key":@"value", @"newKey":@"newValue"};
            
            [RCCacheHelper setObject:dict forKey:key withType:type];

            [[[RCCacheHelper objectForKey:key] should] equal:theNewDict];
        });
    });
    
    context(@"when testing keyPrefixForString 'stringKey'", ^{
        it(@"should equal '__stringKey_(managedByRCHadot)_'", ^{
            NSString *key = @"stringKey";
            NSString *retKey = @"__stringKey_(managedByRCHadot)_";

            [[[RCCacheHelper keyPrefixForString:key] should] equal:retKey];
        });
    });
    
    context(@"when testing keyPrefixForClass 'NSString'", ^{
        it(@"should equal '____NSCFConstantString_(managedByRCHadot)_'", ^{
            NSString *key = @"stringKey";
            NSString *retKey = @"____NSCFConstantString_(managedByRCHadot)_";
            
            [[[RCCacheHelper keyPrefixForClass:key.class] should] equal:retKey];
        });
    });
});

SPEC_END
