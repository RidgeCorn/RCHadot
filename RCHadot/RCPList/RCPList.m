//
//  RCPList.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCPList.h"

@implementation RCPList

+ (id)objectInMainBundlePListWithKey:(NSString *)key {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
}

+ (id)objectInMainBundlePList:(NSString *)plist withKey:(NSString *)key {
    return [RCPList objectInBundle:[NSBundle mainBundle] plist:plist withKey:key];
}

+ (id)objectInBundle:(NSBundle *)bundle plist:(NSString *)plist withKey:(NSString *)key {
    NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:[bundle pathForResource:plist ofType:@"plist"]];
    return [dictionary valueForKeyPath:key];
}

@end
