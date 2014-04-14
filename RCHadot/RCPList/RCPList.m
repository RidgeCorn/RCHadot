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

@end
