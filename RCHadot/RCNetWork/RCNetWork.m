//
//  RCNetWork.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCAppConfig.h"
#import <Reachability.h>
#import "RCNetWork.h"

@implementation RCNetWork

+ (BOOL)isNetworkAvailable {
    BOOL isNetworkAvailable = YES;
    if ([[Reachability reachabilityWithHostname:@"www.baidu.com"] currentReachabilityStatus] == NotReachable) {
        isNetworkAvailable = NO;
    }
    return isNetworkAvailable;
}

+ (BOOL)isServerAvailable {
    BOOL isServerAvailable = YES;
    if ([[Reachability reachabilityWithHostname:[RCAppConfig apiBaseHTTPURLString]] currentReachabilityStatus] == NotReachable) {
        isServerAvailable = NO;
    }
    return isServerAvailable;
}

+ (BOOL) IsUsingWiFi {
    return [[Reachability reachabilityForLocalWiFi] isReachableViaWiFi];
}

+ (BOOL) IsUsing3G {
    return [[Reachability reachabilityForInternetConnection] isReachableViaWWAN];
}

@end
