//
//  RCControllerTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import "RCControllerOptions.h"

typedef NS_ENUM(NSUInteger, RCControllerTaskType) {
    RCControllerTaskTypeOpen = 0,
    RCControllerTaskTypePop
};

@interface RCControllerTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) RCControllerOptions *options;
@property (nonatomic) Class controllerClass;
@property (nonatomic) RCControllerTaskType type;
@property (nonatomic) UINavigationController *navigationController;
@property (nonatomic) BOOL animatedWhenStart;

- (id)initWithKey:(NSString *)key Type:(RCControllerTaskType)type navigationController:(UINavigationController *)navigationController controllerClass:(Class)controllerClass animatedWhenStart:(BOOL)animatedWhenStart options:(RCControllerOptions *)options;

@end
