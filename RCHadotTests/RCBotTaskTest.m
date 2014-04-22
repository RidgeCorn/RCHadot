//
//  RCBotTaskTest.m
//  RCHadot
//
//  Created by Looping on 14-4-22.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCBotTaskTest.h"

@implementation RCBotTaskTest

- (id)initWithKey:(NSString *)key {
    if (self = [super initWithKey:key]) {
        self.delegate = self;
    }
    
    return self;
}

- (void)handleStart:(NSString *)taskKey {
    
}

@end
