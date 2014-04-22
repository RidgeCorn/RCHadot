//
//  RCWeather.h
//  RCHadot
//
//  Created by Looping on 14-4-22.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "JSONModel.h"

@interface RCWeather : JSONModel

@property (nonatomic) NSString *city;
@property (nonatomic) NSNumber *temp;
@property (nonatomic) NSString *updateTime;

@end
