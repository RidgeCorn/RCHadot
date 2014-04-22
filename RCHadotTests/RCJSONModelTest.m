//
//  RCJSONModelTest.m
//  RCHadot
//
//  Created by Looping on 14-4-22.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCJSONModelTest.h"

@implementation RCJSONModelTest

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"username": @"name"
                                                       }];
}

@end
