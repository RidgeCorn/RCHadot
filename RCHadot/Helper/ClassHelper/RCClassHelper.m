//
//  RCClassHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-28.
//  Copyright (c) 2014年 RidgeCorn. All rights reserved.
//

#import "RCClassHelper.h"

@implementation RCClassHelper

+ (id)objectFromClass:(Class)cls {
    RCClassHelper *helperClass = [[RCClassHelper alloc] init];
    
    if (helperClass) {
        helperClass.cls = cls;
    }
    
    return helperClass;
}

@end
