//
//  RCWeather.m
//  RCHadot
//
//  Created by Looping on 14-4-22.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCWeather.h"

@implementation RCWeather

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"time": @"updateTime"
                                                       }];
}

@end
