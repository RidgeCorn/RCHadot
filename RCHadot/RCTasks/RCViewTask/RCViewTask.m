//
//  RCViewTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCViewTask.h"
#import "RCBot.h"

@implementation RCViewTask

- (void)handleStart:(NSString *)taskKey {
    RCViewTask *task = [Bot taskForKey:taskKey];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    switch (task.type) {
        case RCViewTaskTypeAddToView: {
            SEL VIEW_INIT_SELECTOR = sel_registerName("initWithModelData:");
            UIView *view = nil;
            
            if (task.viewClass) {
                view = [(task.viewClass) alloc];
            }
            
            if (_refsView && [view respondsToSelector:VIEW_INIT_SELECTOR]) {
                [_refsView addSubview: [view performSelector:VIEW_INIT_SELECTOR withObject: [Cache valueForKey:_modelKey]]];
            }
        }
            break;
            
        case RCViewTaskTypeRemoveFromSuperView: {
            if (_refsView) {
                [_refsView removeFromSuperview];
            }
        }
            break;
            
        case RCViewTaskTypeRemoveSubViews: {
            if (_viewTags && _refsView) {
                for (NSNumber *tag in _viewTags) {
                    [[_refsView viewWithTag:[tag integerValue]] removeFromSuperview];
                }
            }
        }
            break;
            
        default:
            break;
    }
#pragma clang diagnostic pop

}

@end
