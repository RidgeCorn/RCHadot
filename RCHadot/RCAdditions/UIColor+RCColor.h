//
//  UIColor+RCColor.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RCColor)

+ (UIColor *)colorWithHexString:(NSString *)colorString;
+ (UIColor *)colorWithHexString:(NSString *)colorString alpha:(CGFloat)alpha;
+ (UIColor *)tableViewBackgroundColorOfiOS7;

@end
