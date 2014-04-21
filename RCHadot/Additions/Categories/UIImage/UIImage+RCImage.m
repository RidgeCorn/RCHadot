//
//  UIImage+RCImage.m
//  RCHadot
//
//  Created by Looping on 14-4-2.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//
// ref https://github.com/Cocoanetics/DTFoundation
//

#import "UIImage+RCImage.h"

@implementation UIImage (RCImage)

+ (UIImage *)imageWithSolidColor:(UIColor *)color size:(CGSize)size
{
	NSParameterAssert(color);
	NSAssert(!CGSizeEqualToSize(size, CGSizeZero), @"Size cannot be CGSizeZero");
    
	CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
	UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
	[color setFill];
	UIRectFill(rect);
    
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return image;
}

- (UIImage *)imageMaskedAndTintedWithColor:(UIColor *)color
{
	NSParameterAssert(color);
    
	UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    
	CGRect bounds = (CGRect){CGPointZero, self.size};
    
	CGAffineTransform flipVertical = CGAffineTransformMake(1, 0, 0, -1, 0, bounds.size.height);
	CGContextConcatCTM(ctx, flipVertical);
    
	CGContextClipToMask(ctx, bounds, self.CGImage);
    
	[color setFill];
	CGContextFillRect(ctx, bounds);
    
	UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
    
	return retImage;
}

- (void)drawInRect:(CGRect)rect withContentMode:(UIViewContentMode)contentMode
{
	CGRect drawRect;
	CGSize size = self.size;
    
	switch (contentMode)
	{
		case UIViewContentModeRedraw:
		case UIViewContentModeScaleToFill: {
			[self drawInRect:rect];
			return;
		}
            
		case UIViewContentModeScaleAspectFit: {
			CGFloat factor;
            
			if (size.width < size.height) {
				factor = rect.size.height / size.height;
			} else {
				factor = rect.size.width / size.width;
			}
            
			size.width = roundf(size.width * factor);
			size.height = roundf(size.height * factor);
            
			drawRect = CGRectMake(roundf(CGRectGetMidX(rect) - size.width / 2.0f),
								  roundf(CGRectGetMidY(rect) - size.height / 2.0f),
								  size.width,
								  size.height);
            
			break;
		}
            
		case UIViewContentModeScaleAspectFill: {
			CGFloat factor;
            
			if (size.width < size.height) {
				factor = rect.size.width / size.width;
			} else {
				factor = rect.size.height / size.height;
			}
            
			size.width = roundf(size.width * factor);
			size.height = roundf(size.height * factor);
            
			drawRect = CGRectMake(roundf(CGRectGetMidX(rect) - size.width / 2.0f),
								  roundf(CGRectGetMidY(rect) - size.height / 2.0f),
								  size.width,
								  size.height);
            
			break;
		}
            
		case UIViewContentModeCenter: {
			drawRect = CGRectMake(roundf(CGRectGetMidX(rect) - size.width / 2.0f),
								  roundf(CGRectGetMidY(rect) - size.height / 2.0f),
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeTop: {
			drawRect = CGRectMake(roundf(CGRectGetMidX(rect) - size.width / 2.0f),
								  rect.origin.y-size.height,
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeBottom: {
			drawRect = CGRectMake(roundf(CGRectGetMidX(rect) - size.width / 2.0f),
								  rect.origin.y-size.height,
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeLeft: {
			drawRect = CGRectMake(rect.origin.x,
								  roundf(CGRectGetMidY(rect) - size.height / 2.0f),
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeRight: {
			drawRect = CGRectMake(CGRectGetMaxX(rect) - size.width,
								  roundf(CGRectGetMidY(rect) - size.height / 2.0f),
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeTopLeft: {
			drawRect = CGRectMake(rect.origin.x,
								  rect.origin.y,
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeTopRight: {
			drawRect = CGRectMake(CGRectGetMaxX(rect) - size.width,
								  rect.origin.y,
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeBottomLeft: {
			drawRect = CGRectMake(rect.origin.x,
								  CGRectGetMaxY(rect) - size.height,
								  size.width,
								  size.height);
			break;
		}
            
		case UIViewContentModeBottomRight: {
			drawRect = CGRectMake(CGRectGetMaxX(rect) - size.width,
								  CGRectGetMaxY(rect) - size.height,
								  size.width,
								  size.height);
			break;
		}
	}
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
    
	CGContextAddRect(context, rect);
	CGContextClip(context);
    
	[self drawInRect:drawRect];
    
	CGContextRestoreGState(context);
}

- (UIImage *)tileImageInClipRect:(CGRect)clipRect inBounds:(CGRect)bounds scale:(CGFloat)scale
{
	UIGraphicsBeginImageContextWithOptions(clipRect.size, YES, scale);
    
	CGFloat zoom = self.size.width / bounds.size.width;
    
	CGRect clipInOriginal = clipRect;
	clipInOriginal.origin.x *= zoom;
	clipInOriginal.origin.y *= zoom;
	clipInOriginal.size.width *= zoom;
	clipInOriginal.size.height *= zoom;
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextTranslateCTM(context, -clipRect.origin.x, -clipRect.origin.y);
	CGContextScaleCTM(context, 1.0/zoom, 1.0/zoom);
    
	[self drawAtPoint:CGPointZero];
    
	UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    
	UIGraphicsEndImageContext();
    
	return retImage;
}

- (UIImage *)compress {
    float actualHeight = self.size.height;
    float actualWidth = self.size.width;
    float maxHeight = 600.0;
    float maxWidth = 800.0;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 0.5;
    
    if (actualHeight > maxHeight || actualWidth > maxWidth) {
        if(imgRatio < maxRatio){
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        }else{
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithData:imageData];
}

@end
