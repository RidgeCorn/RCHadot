//
//  RCTaskTestHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTaskTestHelper.h"
#import "RCBot.h"
#import "RCLogger.h"

@implementation RCTaskTestHelper

+ (BOOL)runAllTasksForClass:(Class)cls {
    BOOL trun = YES;
    NSArray *tasks = [Bot allTasks];
    
    if ([tasks count]) {
        for (RCTask *task in tasks) {
            if ([cls isSubclassOfClass:[RCTask class]] && [task isKindOfClass:cls]) {
                BOOL srun = [Bot startTaskWithKey:task.key];
                
                if ( !srun) {
                    RCLog(@"\nTask run failed: \n%@\n", task);
                    
                    if (trun) {
                        trun = NO;
                    }
                }
            }
        }
    } else {
        trun = NO;
    }
    
    return trun;
}

+ (BOOL)runAllTasks {
    BOOL trun = YES;
    NSArray *tasks = [Bot allTasks];
    
    for (RCTask *task in tasks) {
            BOOL srun = [Bot startTaskWithKey:task.key];
            
            if ( !srun) {
                RCLog(@"\nTask run failed: \n%@\n", task);
                
                if (trun) {
                    trun = NO;
                }
            }
    }
    
    return trun;
}

@end
