//
//  RCViewRecord.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCViewRecord.h"
#import "RCWeatherView.h"
#import <UIScreen+RCScreen.h>

@implementation RCViewRecord

+ (void)loadRecordByObject:(id)object {
    
    NSMutableDictionary *mapping = [@{} mutableCopy];
    [mapping setObject:@"cityLabel.text" forKey:@"city"];
    [mapping setObject:@"tempLabel.text" forKey:@"temp"];
    [mapping setObject:@"timeLabel.text" forKey:@"time"];
#warning data
//    [RCMappingHelper addCollection:mapping withKey:kRCWeatherView];

    [Bot record:blockc(task,                       
                       RCViewTask *task = [[RCViewTask alloc] initWithKey:kRCWeatherView Type:RCViewTaskTypeAddToView refsView:object viewClass:[RCWeatherView class] options:[RCViewTaskOptions new]];
                       
                       task.options.viewInitMethod = @"initWithOptions:";
                       task.options.viewTags = @[@101];
                       task.options.styleSheetsKey = @"View";
                       
                       task.options.frame = CGRectMake(0, 0, [UIScreen fullScreenWidth], [UIScreen fullScreenHeight]);
                       task.options.bindModelTaskKey = kRCModelLoadWeather;
                       )];
}

@end
