//
//  RCModelHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelHelper.h"
#import "RCCacheHelper.h"
#import "RCObject.h"

static RCModelHelper *_sharedModelHelper;

static dispatch_once_t onceToken;

@interface RCModelHelper ()

@end

@implementation RCModelHelper

+ (id)sharedModelHelper {
    returnc(_sharedModelHelper,
            dispatch_once(&onceToken, ^{
                _sharedModelHelper = [[RCModelHelper alloc] init];
            })
            );
}

- (void)cacheModel:(id)model forKey:(NSString *)key {
    [Cache setObject:model forKey:[[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString: key]];
}

- (id)modelForCacheKey:(NSString *)key {
    returnc([Cache objectForKey:[[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString: key]]);
}

@end
