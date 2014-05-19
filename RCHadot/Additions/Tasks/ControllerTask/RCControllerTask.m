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

- (id)initWithKey:(NSString *)key refsByObject:(id)object {
    if(self = [super initWithKey:key refsByObject:object]) {
        self.delegate = self;
        
        [RACObserve(self, state) subscribeNext:^(NSNumber *state) {
            if (_stateBlock) {
                _stateBlock(self);
            }
        }];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        self.delegate = self;
        
        [RACObserve(self, state) subscribeNext:^(NSNumber *state) {
            if (_stateBlock) {
                _stateBlock(self);
            }
        }];
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key Type:(RCControllerTaskType)type navigationController:(UINavigationController *)navigationController controllerClass:(__unsafe_unretained Class)controllerClass options:(RCControllerTaskOptions *)options {
    if ([self initWithKey:key refsByObject:navigationController]) {
        _type = type;
        _controllerClass = controllerClass;
        _options = options;
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock {
    if (self = [super initWithKey:key runBlock:runBlock]) {
        self.delegate = self;
    }
    
    return self;
}

- (BOOL)handleRecord:(RCControllerTask *)task {
    if (_runBlock) {
        [[Routable sharedRouter] map:task.key toCallback:^(NSDictionary *params) {
            _runBlock(self);
        } withOptions:_options];
    } else {
        if (_options) {
            [[Routable sharedRouter] map:task.key toController:task.controllerClass withOptions:_options];
            
            if (_options.shouldOpenAsRootViewController && self.refsObj) {
                [[Routable sharedRouter] setNavigationController:self.refsObj];
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

- (void)resetRefsObj:(UINavigationController *)controller {
    if (controller) {
        self.refsObj = controller;
    }
    
    [[Routable sharedRouter] setNavigationController:self.refsObj];
}

@end
