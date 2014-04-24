//
//  RCControllerTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCControllerTask.h"

@interface RCControllerTask ()

@end


@implementation RCControllerTask
- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *key = [aDecoder decodeObjectForKey:@"key"];
    
    if(self = [self initWithKey:key]) {
        
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.key forKey:@"key"];
}

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        self.delegate = self;
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key Type:(RCControllerTaskType)type navigationController:(UINavigationController *)navigationController controllerClass:(__unsafe_unretained Class)controllerClass options:(RCControllerTaskOptions *)options {
    if ([self initWithKey:key]) {
        _type = type;
        _navigationController = navigationController;
        _controllerClass = controllerClass;
        _options = options;
    }
    
    return self;
}

- (BOOL)handleRecord:(RCControllerTask *)task {
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
    
    return YES;
}

- (BOOL)handleStart:(RCControllerTask *)task {
    if (self.type == RCControllerTaskTypeOpen) {
        [[Routable sharedRouter] open:task.key animated:_options.animatedWhenStart];
    } else {
        [[Routable sharedRouter] pop:_options.animatedWhenStart];
    }
    
    return YES;
}

@end
