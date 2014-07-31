//
//  RCDeviceHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCDeviceHelper.h"

@implementation RCDeviceHelper

+ (float)systemVersion {
    return [[self systemVersionString] floatValue];
}

+ (BOOL)is4InchDevice {
    return [self fullScreenHeight] == 568 && [self fullScreenWidth] == 320;
}

+ (float)fullScreenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (float)fullScreenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGPoint)screenCenter {
    return CGPointMake([self fullScreenWidth] / 2, [self fullScreenHeight] / 2);
}

+ (NSString *)systemVersionString {
    return [UIDevice currentDevice].systemVersion;
}

+ (NSString *)deviceModel {
    return [UIDevice currentDevice].model;
}

+ (NSString *)systemName {
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)deviceUUIDString {
    NSString *result;
    
    if ([self systemVersion] > 6.0) {
        result = [UIDevice currentDevice].identifierForVendor.UUIDString;
    } else {
        CFUUIDRef puuid = CFUUIDCreate( nil );
        CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
        result = CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
        
        CFRelease(puuid);
        CFRelease(uuidString);
    }
    
    return result;
}

+ (BOOL)callNumber:(NSString *)phoneNumber {
    BOOL called = NO;
    
    NSURL *phoneCallURL = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@", phoneNumber]];
    
    if([[UIApplication sharedApplication] canOpenURL: phoneCallURL]){
        [[UIApplication sharedApplication] openURL: phoneCallURL];
        called = YES;
    }
    
    return called;
}

+ (void)beginNetworkTask {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

+ (void)endNetworkTask {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

+ (UIViewController *)topViewController {
    return [RCDeviceHelper topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)topViewController:(UIViewController *)rootViewController {
    if (rootViewController.presentedViewController == nil) {
        if ([rootViewController isKindOfClass:[UINavigationController class]]) {
            rootViewController = ((UINavigationController *)rootViewController).topViewController;
        }
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [RCDeviceHelper topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [RCDeviceHelper topViewController:presentedViewController];
}

@end
