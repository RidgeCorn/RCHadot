//
//  RCWeatherView.m
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCWeatherView.h"

@implementation RCWeatherView

- (id)initWithOptions:(RCViewOptions *)options {
    if (self = [self initWithFrame:options.frame]) {

    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self configSubviews];
    }
    
    return self;
}

- (void)configSubviews {
    _cityLabel = [UILabel new];
    [self addSubview:_cityLabel];
    
    _tempLabel = [UILabel new];
    [self addSubview:_tempLabel];
    
    _timeLabel = [UILabel new];
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
