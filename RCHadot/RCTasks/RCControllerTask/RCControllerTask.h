//
//  RCControllerTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import <Routable.h>

typedef NS_ENUM(NSUInteger, RCControllerTaskType) {
    RCControllerTaskTypeOpen = 0,
    RCControllerTaskTypePop
};

@interface RCControllerTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) UPRouterOptions *options;
@property (nonatomic) Class controllerClass;
@property (nonatomic) RCControllerTaskType type;
@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) BOOL animatedWhenStart;

@end
