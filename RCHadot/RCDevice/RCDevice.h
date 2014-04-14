//
//  RCDevice.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCDevice : RCObject

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

@end
