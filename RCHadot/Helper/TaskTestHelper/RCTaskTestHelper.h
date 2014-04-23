//
//  RCTaskTestHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCTaskTestHelper : RCObject

+ (BOOL)runAllTasksForClass:(Class)cls;
+ (BOOL)runAllTasks;

@end
