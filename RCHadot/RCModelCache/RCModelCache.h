//
//  RCModelCache.h
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#define ModelCache [RCModelCache sharedModelCache]

@interface RCModelCache : RCObject

+ (id)sharedModelCache;

- (void)setModelObject:(id)model forKey:(NSString *)key;
- (id)modelForKey:(NSString *)key;

@end
