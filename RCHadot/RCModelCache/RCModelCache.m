//
//  RCModelCache.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelCache.h"
#import "RCCacheHelper.h"
#import "RCObject.h"

static RCModelCache *_sharedModelCache;

static dispatch_once_t onceToken;

@interface RCModelCache ()

@end

@implementation RCModelCache

+ (id)sharedModelCache {
    returnc(_sharedModelCache,
            dispatch_once(&onceToken, ^{
                _sharedModelCache = [[RCModelCache alloc] init];
            })
            );
}

- (void)setModelObject:(id)model forKey:(NSString *)key {
    [Cache setObject:model forKey:[[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString: key]];
}

- (id)modelForKey:(NSString *)key {
    returnc([Cache objectForKey:[[RCCacheHelper keyPrefixForClass:self.class] stringByAppendingString: key]]);
}

@end
