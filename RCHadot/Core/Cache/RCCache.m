//
//  RCCache.m
//  RCHadot
//
//  Created by Looping on 14-4-21.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCCache.h"

@implementation RCCache

- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key {
//    NSLog(@"RCCache\nsetObject: %@ \nforKey: %@\n\n", object, key);
    
    [super setObject:object forKey:key];
}

- (id)objectForKey:(NSString *)key {
//    NSLog(@"RCCache\nobjectForKey: %@\n\n", key);
    
    return [super objectForKey:key];
}

@end
