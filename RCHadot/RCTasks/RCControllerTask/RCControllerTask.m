//
//  RCControllerTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCControllerTask.h"

@interface RCControllerTask ()

@end


@implementation RCControllerTask

- (id)init {
    returnc(self,
            if(self = [super init]) {
                self.delegate = self;
            });
}

- (void)handleRecord:(RCControllerTask *)task {
    if (task.runBlock) {
        [[Routable sharedRouter] map:task.key toCallback:^(NSDictionary *params) {
            task.runBlock(self);
        } withOptions:_options];
    } else {
        if (_options) {
            [[Routable sharedRouter] map:task.key toController:task.controllerClass withOptions:_options];
            
            if (_options.shouldOpenAsRootViewController && task.navigationController) {
                [[Routable sharedRouter] setNavigationController:task.navigationController];
            }
        } else {
            [[Routable sharedRouter] map:task.key toController:task.controllerClass];
        }
    }
}

- (void)handleStart:(NSString *)taskKey {
    if (self.type == RCControllerTaskTypeOpen) {
        [[Routable sharedRouter] open:taskKey animated:_animatedWhenStart];
    } else {
        [[Routable sharedRouter] pop:_animatedWhenStart];
    }
}

- (void)handleRemove:(NSString *)taskKey {
    // NOT Support! It's unnecessary.
}

@end
