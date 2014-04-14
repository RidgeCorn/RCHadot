//
//  RCVerify.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCVerify.h"

@implementation RCVerify

+ (BOOL)isDataNil:(id)data {
    BOOL isDataNil = NO;
    if (data == nil || [data isKindOfClass:[NSNull class]]) {
        isDataNil = YES;
    }
    return isDataNil;
}

+ (BOOL)isFloatZero:(CGFloat)floatValue {
    return (floatValue < 0.000001 && floatValue > -0.000001);
}

+ (BOOL)isDataZero:(id)data {
    BOOL isZero = NO;

    if ([self isDataNil:data]) {
        isZero = YES;
    } else {
        CGFloat value = 0;
        
        if ([data isKindOfClass:[NSString class]] || [data isKindOfClass:[NSNumber class]]) {
            value = [data floatValue];
        }
        
        isZero = [self isFloatZero:value];
    }
    return isZero;
}

@end
