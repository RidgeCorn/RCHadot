//
//  UIImage+RCImage.h
//  RCHadot
//
//  Created by Looping on 14-4-2.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RCImage)

+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)imageMaskedAndTintedWithColor:(UIColor *)color;
- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode;
- (UIImage *)tileImageInClipRect:(CGRect)clipRect inBounds:(CGRect)bounds scale:(CGFloat)scale;
- (UIImage *)compress;

@end
