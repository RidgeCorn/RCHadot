//
//  RCNetWorkHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCAppConfigHelper.h"
#import <Reachability.h>
#import "RCNetWorkHelper.h"

@implementation RCNetWorkHelper

+ (BOOL)isNetworkAvailable {
    BOOL isNetworkAvailable = YES;
    if ([[Reachability reachabilityWithHostname:@"www.baidu.com"] currentReachabilityStatus] == NotReachable) {
        isNetworkAvailable = NO;
    }
    return isNetworkAvailable;
}

+ (BOOL)isServerAvailable {
    BOOL isServerAvailable = YES;
    if ([[Reachability reachabilityWithHostname:[RCAppConfigHelper apiBaseHTTPURLString]] currentReachabilityStatus] == NotReachable) {
        isServerAvailable = NO;
    }
    return isServerAvailable;
}

+ (BOOL)IsUsingWiFi {
    return [[Reachability reachabilityForLocalWiFi] isReachableViaWiFi];
}

+ (BOOL)IsUsing3G {
    return [[Reachability reachabilityForInternetConnection] isReachableViaWWAN];
}

@end
