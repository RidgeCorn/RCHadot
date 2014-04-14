//
//  UIColor+RCColor.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "UIColor+RCColor.h"

@implementation UIColor (RCColor)

+ (NSString *)checkHexString:(NSString *)string {
    NSString *rString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([rString length] < 6) {
        rString = @"FFFFFF";
    }
    
    if ([rString hasPrefix:@"0X"])
        rString = [rString substringFromIndex:2];
    if ([rString hasPrefix:@"#"])
        rString = [rString substringFromIndex:1];
    if ([rString length] != 6)
        rString = @"FFFFFF";
    
    return rString;
}

+ (float)redValueInHexString:(NSString *)cString {
    unsigned int r;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(0, 2)]] scanHexInt:&r];

    return ((float) r / 255.0f);
}

+ (float)greenValueInHexString:(NSString *)cString {
    unsigned int g;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(2, 2)]] scanHexInt:&g];
    
    return ((float) g / 255.0f);
}

+ (float)blueValueInHexString:(NSString *)cString {
    unsigned int b;
    
    [[NSScanner scannerWithString:[cString substringWithRange:NSMakeRange(4, 2)]] scanHexInt:&b];
    
    return ((float) b / 255.0f);
}

+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha {
    NSString *cString = [self checkHexString:colorString];
    
    return [UIColor colorWithRed:[self redValueInHexString:cString] green:[self greenValueInHexString:cString] blue:[self blueValueInHexString:cString] alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)colorString {
    return [self colorWithHexString:colorString alpha:1.f];
}

+ (UIColor *)tableViewBackgroundColorOfiOS7 {
    return [UIColor colorWithRed:239 / 255.0 green:239 / 255.0 blue:244 / 255.0 alpha:1];
}

@end
