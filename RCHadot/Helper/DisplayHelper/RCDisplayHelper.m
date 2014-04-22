//
//  RCDisplayHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCDisplayHelper.h"

@implementation RCDisplayHelper

+ (void)displayData:(NSDictionary *)dict inView:(id)view withMapping:(NSDictionary *)mapping{
    if (dict && view && mapping) {
        NSArray *allKeys = [mapping allKeys];
        
        for (NSString *keyPath in allKeys) {
            [view setValue:[dict valueForKey:keyPath] forKeyPath:[mapping valueForKey:keyPath]];
        }
    }
}

@end
