//
//  RCDeviceHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCDeviceHelper : RCObject

+ (float)systemVersion;
+ (BOOL)is4InchDevice;
+ (float)fullScreenHeight;
+ (float)fullScreenWidth;
+ (CGPoint)screenCenter;

+ (NSString *)systemVersionString;
+ (NSString *)deviceModel;
+ (NSString *)systemName;
+ (NSString *)deviceUUIDString;

+ (BOOL)callNumber:(NSString *)phoneNumber;

+ (void)beginNetworkTask;
+ (void)endNetworkTask;

+ (UIViewController *)topViewController;

+ (UIViewController *)topViewController:(UIViewController *)rootViewController;

@end
