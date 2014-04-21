//
//  RCPListHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCPListHelper : RCObject

+ (id)objectInMainBundlePListWithKey:(NSString *)key;

+ (id)objectInMainBundlePList:(NSString *)plist withKey:(NSString *)key;

+ (id)objectInBundle:(NSBundle *)bundle plist:(NSString *)plist withKey:(NSString *)key;

@end
