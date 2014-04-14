//
//  RCAppConfig.h
//  RCHadot
//
//  Created by Looping on 14-3-18.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kRCSqliteStoreFileName = @"RCSqliteStoreFileName";

static NSString *const kCFBundleVersion = @"CFBundleVersion";
static NSString *const kCFBundleShortVersionString = @"CFBundleShortVersionString";
static NSString *const kCFBundleDisplayName = @"CFBundleDisplayName";
static NSString *const kRCDefaultCoordinateString = @"RCDefaultCoordinateString";
static NSString *const kCFBundleURLSchemes = @"CFBundleURLSchemes";

static NSString *const kRCDefaultCoordinateType = @"RCDefaultCoordinateType";
static NSString *const kRCDefaultProductIntroduction = @"RCDefaultProductIntroduction";
static NSString *const kRCDefaultProductCopyright = @"RCDefaultProductCopyright";
static NSString *const kRCDefaultContactNumber = @"RCDefaultContactNumber";
static NSString *const kRCDefaultAppID = @"RCDefaultAppID";
static NSString *const kRCDefaultBundleName = @"RCDefaultBundleName";
static NSString *const kUIMainStoryboardFile = @"UIMainStoryboardFile";
static NSString *const kCFBundleURLTypes = @"CFBundleURLTypes";
static NSString *const kRCDefaultAPIBaseURL = @"RCDefaultAPIBaseURL";
static NSString *const kRCDefaultCookieBaseURL = @"RCDefaultCookieBaseURL";
static NSString *const kRCApplicationTintColor = @"RCApplicationTintColor";

@interface RCAppConfig : NSObject

+ (NSString *)bundleIdentifier;
+ (NSString *)bundleVersion;
+ (NSString *)bundleName;
+ (NSString *)appScheme;
+ (NSString *)mainStoryboardFile;
+ (NSString *)sqliteStoreFilename;

+ (NSString *)shortBuildString;
+ (NSString *)versionString;
+ (NSString *)defaultCoordinateString;
+ (NSString *)coordinateType;
+ (NSString *)productIntroduction;
+ (NSString *)productCopyright;
+ (NSString *)contactNumber;
+ (NSString *)appID;

+ (NSString *)apiBaseURLString;
+ (NSString *)apiBaseHTTPURLString;
+ (NSString *)apiBaseHTTPSURLString;
+ (NSString *)cookieBaseURLString;
+ (NSString *)userAgent;

@end
