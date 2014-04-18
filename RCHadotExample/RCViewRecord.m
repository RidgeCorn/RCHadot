//
//  RCViewRecord.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCViewRecord.h"
#import "RCWeatherView.h"

@implementation RCViewRecord

+ (void)loadRecordByObject:(id)object {
    
    NSMutableDictionary *mapping = [@{} mutableCopy];
    [mapping setObject:@"cityLabel.text" forKey:@"city"];
    [mapping setObject:@"tempLabel.text" forKey:@"temp"];
    [mapping setObject:@"timeLabel.text" forKey:@"time"];
    [Mapping addCollection:mapping withKey:kRCWeatherView];

    [Bot record:blockc(task,                       
                       RCViewTask *task = [[RCViewTask alloc] initWithKey:kRCWeatherView Type:RCViewTaskTypeAddToView refsView:object viewClass:[RCWeatherView class] options:[RCViewOptions new]];
                       
                       task.options.viewInitMethod = @"initWithOptions:";
                       task.options.viewTags = @[@101];
                       task.options.cacheValuePaths = @[@"kRCWeatherInfo..city", @"kRCWeatherInfo..temp", @"kRCWeatherInfo..time"];
                       task.options.mappingCollectionKey = kRCWeatherView;
                       task.options.styleSheetsKey = @"View";
                       
                       task.options.frame = CGRectMake(0, 0, [RCDevice fullScreenWidth], [RCDevice fullScreenHeight]);
                       )];
}

@end
