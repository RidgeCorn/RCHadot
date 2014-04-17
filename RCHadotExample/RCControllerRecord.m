//
//  RCControllerRecord.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCControllerRecord.h"
#import "RCViewController.h"
#import "RCNewViewController.h"

@implementation RCControllerRecord

+ (void)loadRecordByObject:(id)object {
    [Bot record:blockc(task,
                       RCControllerTask *task = [[RCControllerTask alloc] initWithKey:kRCViewController Type:RCControllerTaskTypeOpen navigationController:[UINavigationController new] controllerClass:[RCViewController class] options:[RCControllerOptions new]];

                       task.options.animatedWhenStart = YES;
                       task.options.shouldOpenAsRootViewController = YES;
                       )];
    
    [Bot record:blockc(task,
                       RCControllerTask *task = [[RCControllerTask alloc] initWithKey:kRCNewViewController Type:RCControllerTaskTypeOpen navigationController:nil controllerClass:[RCNewViewController class] options:[RCControllerOptions new]];
                       
                       task.options.animatedWhenStart = YES;
                       ) ];
}

@end
