//
//  RCViewTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCViewTask.h"

@implementation RCViewTask

- (void)handleStart:(NSString *)taskKey {
    RCViewTask *task = [Bot taskForKey:taskKey];
    SEL VIEW_INIT_SELECTOR = sel_registerName("initWithModelData:");
    UIView *view = nil;
    
    if (task.viewClass) {
        view = [(task.viewClass) alloc];
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    switch (task.type) {
        case RCViewTaskTypeAddToView: {
            
            if ([view respondsToSelector:VIEW_INIT_SELECTOR]) {
                [_superView addSubview: [view performSelector:VIEW_INIT_SELECTOR withObject: _modelData]];
            }
            
        }
            break;
        case RCViewTaskTypeAddSubViews: {
            
        }
            break;
        case RCViewTaskTypeRemoveViews: {
            
        }
            break;
        case RCViewTaskTypeRemoveSubViews: {
            
        }
            break;
            
        default:
            break;
    }
#pragma clang diagnostic pop

}

@end
