//
//  RCVerify.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCVerify : RCObject

+ (BOOL)isDataNil:(id)data;
+ (BOOL)isFloatZero:(CGFloat)floatValue;
+ (BOOL)isDataZero:(id)data;

@end
