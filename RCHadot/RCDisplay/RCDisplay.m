//
//  RCDisplay.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCDisplay.h"

@implementation RCDisplay

+ (void)displayData:(NSDictionary *)dict inView:(id)view withMapping:(NSDictionary *)mapping{
    if (dict && view && mapping) {
        NSArray *allKeys = [mapping allKeys];
        for (NSString *keyPath in allKeys) {
            [view setValue:[dict valueForKey:keyPath] forKeyPath:[mapping valueForKey:keyPath]];
        }
    } else {
        NSAssert(0, @"\n\nDisplay nil is not allowed!\n\n");
    }
}

@end
