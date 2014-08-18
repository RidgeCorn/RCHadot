//
//  NSDate+RCDate.h
//  RCHadot
//
//  Created by Looping on 14/8/7.
//  Copyright (c) 2014年 RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RCDate)

+ (NSString *)dateValueFromFormatterString:(NSString *)fstring;
+ (NSString *)currentYear;
+ (NSString *)currentMonth;
+ (NSString *)currentDay;

@end
