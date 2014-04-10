//
//  RCModelTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCModelTask.h"

@implementation RCModelTask

- (void)handleStart:(NSString *)taskKey {
    
    RCModelTask *task = [Bot taskForKey:taskKey];
    switch (task.type) {
        case RCModelTaskTypeLoadFromServer: {

        }
            break;
        case RCModelTaskTypeLoadFromCache: {
        }
            break;
        case RCModelTaskTypeLoadFromDatabase: {
        }
            break;
        case RCModelTaskTypeSendToServer: {
        }
            break;
            
        default:
            break;
    }
}

@end
