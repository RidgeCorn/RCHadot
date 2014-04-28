//
//  RCWeatherView.m
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCWeatherView.h"
#import "RCWeather.h"

@interface RCWeatherView ()

@property (nonatomic) RCWeather *weather;

@end

@implementation RCWeatherView

- (id)initWithOptions:(RCViewTaskOptions *)options {
    if (self = [self initWithFrame:options.frame]) {
        _weather = options.models[@"weatherinfo"];
        
        [self configSubviews];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

    }
    
    return self;
}

- (void)configSubviews {
    _cityLabel = [UILabel new];
    _cityLabel.text = _weather.city;
    [_cityLabel setNuiClass:[RCStyleSheetsHelper genStyleClassInView:_cityLabel withNames:@[@"LargeLabel"]]];
    [self addSubview:_cityLabel];
    
    _tempLabel = [UILabel new];
    _tempLabel.text = [_weather.temp stringValue];
    [_tempLabel setNuiClass:[RCStyleSheetsHelper genStyleClassInView:_cityLabel withNames:@[]]];
    [self addSubview:_tempLabel];
    
    _timeLabel = [UILabel new];
    _timeLabel.text = _weather.updateTime;
    [_timeLabel setNuiClass:[RCStyleSheetsHelper genStyleClassInView:_cityLabel withNames:@[@"SmallLabel"]]];
    [self addSubview:_timeLabel];
}

- (void)layoutSubviews {
    [_cityLabel sizeToFit];
    [_cityLabel setCenter:CGPointMake(100, 100)];
    
    [_tempLabel sizeToFit];
    [_tempLabel setCenter:CGPointMake(100, 200)];
    
    [_timeLabel sizeToFit];
    [_timeLabel setCenter:CGPointMake(100, 300)];
}

@end
