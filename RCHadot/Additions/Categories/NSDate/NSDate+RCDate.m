//
//  NSDate+RCDate.m
//  RCHadot
//
//  Created by Looping on 14/8/7.
//  Copyright (c) 2014年 RidgeCorn. All rights reserved.
//

#import "NSDate+RCDate.h"

@implementation NSDate (RCDate)

+ (NSString *)dateValueFromFormatterString:(NSString *)fstring {
    return [({NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; [formatter setDateFormat:fstring]; formatter;}) stringFromDate:[NSDate date]];
}

+ (NSString *)currentYear {
    return [self dateValueFromFormatterString:@"YYYY"];
}

+ (NSString *)currentMonth {
    return [self dateValueFromFormatterString:@"MM"];
}

+ (NSString *)currentDay {
    return [self dateValueFromFormatterString:@"dd"];
}

@end
