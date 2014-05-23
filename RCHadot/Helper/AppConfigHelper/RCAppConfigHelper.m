//
//  RCAppConfigHelper.m
//  RCHadot
//
//  Created by Looping on 14-3-18.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCPListHelper.h"
#import "RCDeviceHelper.h"
#import "RCAppConfigHelper.h"

@implementation RCAppConfigHelper

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)sqliteStoreFilename {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCSqliteStoreFileName];
}

+ (NSString *)productDisplayName {
    return [RCPListHelper objectInMainBundlePListWithKey:kCFBundleDisplayName];
}

+ (NSString *)defaultCoordinateString {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultCoordinateString];
}

+ (NSString *)coordinateType {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultCoordinateType];
}

+ (NSString *)productIntroduction {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultProductIntroduction];
}

+ (NSString *)productCopyright {
    NSString*copyright = [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultProductCopyright];
    NSArray *copyrights = [copyright componentsSeparatedByString:@"/"];
    copyright = @"";
    for (NSString *cr in copyrights) {
        copyright = [copyright stringByAppendingString:[cr stringByAppendingString:@"\n"]];
    }
    if([copyright length] > 1) {
        copyright = [copyright substringToIndex:[copyright length] - 1];
    }
    return copyright;
}

+ (NSString *)contactNumber {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultContactNumber];
}

+ (NSString *)appID {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultAppID];
}

+ (NSString *)bundleName {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultBundleName];
}

+ (NSString *)mainStoryboardFile {
    return [RCPListHelper objectInMainBundlePListWithKey:kUIMainStoryboardFile];
}

+ (NSString *)appScheme {
    NSArray *URLTypes = [RCPListHelper objectInMainBundlePListWithKey:kCFBundleURLTypes];
    NSArray *appSchemeArray = [[URLTypes firstObject] valueForKey:kCFBundleURLSchemes];
    return [appSchemeArray firstObject];
}

+ (NSString *)apiBaseURLString {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultAPIBaseURL];
}

+ (NSString *)apiBaseHTTPURLString {
    return  [@"http://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)apiBaseHTTPSURLString {
    return  [@"https://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)cookieBaseURLString {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCDefaultCookieBaseURL];
}

+ (NSString *)userAgent {
    return [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@", [self bundleName], [self versionString], [RCDeviceHelper systemName], [RCDeviceHelper systemVersionString], [RCDeviceHelper deviceModel], [RCDeviceHelper deviceUUIDString]];
}

+ (NSString *)bundleVersion {
    return [RCPListHelper objectInMainBundlePListWithKey:kCFBundleVersion];
}

+ (NSString *)shortBuildString {
    NSString *bundleVersion = [self bundleVersion];
    return [bundleVersion length] > 6 ? [bundleVersion substringToIndex:6] : ([bundleVersion isEqualToString:@""] ? @"123456" : bundleVersion);
}

+ (NSString *)versionString {
    return [RCPListHelper objectInMainBundlePListWithKey:kCFBundleShortVersionString];
}

+ (NSString *)applicationTintColorString {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCApplicationTintColor];
}

+ (NSString *)applicationBackgrandColorString {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCApplicationBackgrandColor];
}

+ (NSString *)applicationThemeKey {
    return [RCPListHelper objectInMainBundlePListWithKey:kRCApplicationThemeKey];
}

@end
