//
//  RCModelRecord.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCModelRecord.h"
#import "RCModelTask.h"

@implementation RCModelRecord

+ (void)loadRecordByObject:(id)object {
    [Bot record:blockc(task,
                       RCModelTask *task = [[RCModelTask alloc] initWithKey:kRCModelLoadWeather type:RCModelTaskTypeLoadFromServerWithGet requestPath:@"data/sk/101210101.html" options:[RCModelTaskOptions new]];
                       
                       task.options.responseDataKeyPath = @"weatherinfo";
                       task.options.toCacheKey = @"kRCWeatherInfo";
                       )];
    
}

@end
