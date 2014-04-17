//
//  RCCache.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCCache.h"
#import "NSDictionary+RCDictionary.h"

@implementation RCCache

+ (TMCache *)sharedTMCache {
    returnc([TMCache sharedCache]);
}

+ (NSDictionary *)dictInCacheWithCachePaths:(NSArray *)cachePaths {
    returnc(dict,
            NSMutableDictionary *dict = [@{} mutableCopy];
            if (cachePaths) {
                for (NSString *key in cachePaths) {
                    NSInteger dotLocation = [key rangeOfString:@"."].location;

                    if (dotLocation == NSNotFound) {
                        continue;
                    }
                    NSString *cacheKey = [key substringToIndex:dotLocation];

                    id value = [Cache objectForKey:cacheKey];
                    
                    if ([value isKindOfClass:[NSDictionary class]]) {
                        NSString *valuePathKey = [key substringFromIndex:dotLocation + 2];
                        NSString *sepatator = [key substringWithRange:NSMakeRange(dotLocation + 1, 1)];

                        [dict setValue:[value valueForKeyPath:valuePathKey separatedString:sepatator] forKey:valuePathKey];

                    } else {
                        [dict setValue:value forKey:cacheKey];
                    }
                }

            }
            );
}

@end
