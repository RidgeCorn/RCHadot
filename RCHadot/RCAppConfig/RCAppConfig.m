//
//  RCAppConfig.m
//  RCHadot
//
//  Created by Looping on 14-3-18.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCPList.h"
#import "RCDevice.h"
#import "RCAppConfig.h"

@implementation RCAppConfig

+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)sqliteStoreFilename {
    return [RCPList objectInMainBundlePListWithKey:kRCSqliteStoreFileName];
}

+ (NSString *)productDisplayName {
    return [RCPList objectInMainBundlePListWithKey:kCFBundleDisplayName];
}

+ (NSString *)defaultCoordinateString {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultCoordinateString];
}

+ (NSString *)coordinateType {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultCoordinateType];
}

+ (NSString *)productIntroduction {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultProductIntroduction];
}

+ (NSString *)productCopyright {
    NSString*copyright = [RCPList objectInMainBundlePListWithKey:kRCDefaultProductCopyright];
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
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultContactNumber];
}

+ (NSString *)appID {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultAppID];
}

+ (NSString *)bundleName {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultBundleName];
}

+ (NSString *)mainStoryboardFile {
    return [RCPList objectInMainBundlePListWithKey:kUIMainStoryboardFile];
}

+ (NSString *)appScheme {
    NSArray *URLTypes = [RCPList objectInMainBundlePListWithKey:kCFBundleURLTypes];
    NSArray *appSchemeArray = [[URLTypes firstObject] valueForKey:kCFBundleURLSchemes];
    return [appSchemeArray firstObject];
}

+ (NSString *)apiBaseURLString {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultAPIBaseURL];
}

+ (NSString *)apiBaseHTTPURLString {
    return  [@"http://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)apiBaseHTTPSURLString {
    return  [@"https://" stringByAppendingString:[self apiBaseURLString]];
}

+ (NSString *)cookieBaseURLString {
    return [RCPList objectInMainBundlePListWithKey:kRCDefaultCookieBaseURL];
}

+ (NSString *)userAgent {
    return [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@", [self bundleName], [self versionString], [RCDevice systemName], [RCDevice systemVersionString], [RCDevice deviceModel], [RCDevice deviceUUIDString]];
}

+ (NSString *)bundleVersion {
    return [RCPList objectInMainBundlePListWithKey:kCFBundleVersion];
}

+ (NSString *)shortBuildString {
    NSString *bundleVersion = [self bundleVersion];
    return [bundleVersion length] > 6 ? [bundleVersion substringToIndex:6] : ([bundleVersion isEqualToString:@""] ? @"123456" : bundleVersion);
}

+ (NSString *)versionString {
    return [RCPList objectInMainBundlePListWithKey:kCFBundleShortVersionString];
}

@end
