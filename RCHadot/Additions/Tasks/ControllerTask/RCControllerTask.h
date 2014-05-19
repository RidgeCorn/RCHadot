//
//  RCControllerTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import "RCControllerTaskOptions.h"

typedef NS_ENUM(NSUInteger, RCControllerTaskType) {
    RCControllerTaskTypeOpen = 0,
    RCControllerTaskTypePop
};

@interface RCControllerTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) RCControllerTaskOptions *options;
@property (nonatomic) Class controllerClass;
@property (nonatomic) RCControllerTaskType type;

- (id)initWithKey:(NSString *)key Type:(RCControllerTaskType)type navigationController:(UINavigationController *)navigationController controllerClass:(Class)controllerClass options:(RCControllerTaskOptions *)options;

- (void)resetRefsObj:(UINavigationController *)controller;

@end
