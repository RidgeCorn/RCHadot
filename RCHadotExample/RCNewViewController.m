//
//  RCNewViewController.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCNewViewController.h"
#import "RCViewRecord.h"
#import "RCStyleSheetsHelper.h"

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
    
    RCModelTask *task = (RCModelTask *)[Bot taskForKey:kRCModelLoadWeather];
    task.refsObj = self;
    
    [task handleStateBlock:^(RCModelTask <RCTaskHandleDelegate> *task_b) {
        switch (task_b.state) {
            case RCTaskStateRecored: {
                RCLog(@"RCTaskStateRecored");
            }
                break;
            case RCTaskStateStart: {
                RCLog(@"RCTaskStateStart");
            }
                break;
            case RCTaskStateCompletedWithSucceeded: {
                RCLog(@"RCTaskStateCompletedWithSucceeded");
                
                [Bot startTaskWithKey:kRCWeatherView removeAfterDone:YES];
            }
                break;
            case RCTaskStateCompletedWithError: {
                RCLog(@"RCTaskStateCompletedWithError");
            }
                break;
                
            default: {
                RCLog(@"Unkown state!!!");
            }
                break;
        }
    }];
    
    [Bot startTask:task];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
