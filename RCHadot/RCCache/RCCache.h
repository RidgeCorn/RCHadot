//
//  RCCache.h
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import <TMCache.h>

#define Cache [RCCache sharedTMCache]

@interface RCCache : RCObject

+ (TMCache *)sharedTMCache;

@end
