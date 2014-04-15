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
    return (data == nil || [data isKindOfClass:[NSNull class]]);
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

+ (id)safeData:(id)data {
    return [self isDataNil:data] ? @"" : data;
}

@end
