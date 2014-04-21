//
//  RCModelHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#define ModelHelper [RCModelHelper sharedModelHelper]

@interface RCModelHelper : RCObject

+ (id)sharedModelHelper;

- (void)cacheModel:(id)model forKey:(NSString *)key;
- (id)modelForCacheKey:(NSString *)key;

@end
