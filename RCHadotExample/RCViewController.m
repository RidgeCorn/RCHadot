//
//  RCViewController.m
//  RCHadot
//
//  Created by Looping on 14-3-29.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCViewController.h"

@interface RCViewController ()

@end

@implementation RCViewController

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        self.title = @"Module";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:blockc(button,
                                 UIButton *button = [[UIButton alloc] initWithFrame:self.view.frame];
                                 [button setBackgroundColor:[UIColor greenColor]];
                                 button.tag = 1001;
                                 [button setTitle:@"Here !!!" forState:UIControlStateNormal];
                                 button.rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [Bot startTaskWithKey:kRCNewViewController];
        return [RACSignal empty];
    }];
                                 )];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
