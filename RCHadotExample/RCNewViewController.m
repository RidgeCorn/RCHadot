//
//  RCNewViewController.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCNewViewController.h"
#import "RCViewRecord.h"

@interface RCNewViewController ()

@end

@implementation RCNewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        [self setTitle:@"Weather"];
        [self.view setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [RCViewRecord loadRecordByObject:self.view];
    
    [Bot start:kRCModelLoadWeather];
    
    RCModelTask *task = [Bot taskForKey:kRCModelLoadWeather];

    [RACObserve(task, state) subscribeNext:^(NSNumber *state) {
        if ([state isEqualToNumber: @(RCTaskStateCompletedWithSucceeded)]) {
            [Bot start:kRCWeatherView removeAfterDone:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
