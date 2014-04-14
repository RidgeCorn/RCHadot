//
//  RCCache.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCCache.h"

@implementation RCCache

+ (TMCache *)sharedTMCache {
    returnc([TMCache sharedCache]);
}

@end
