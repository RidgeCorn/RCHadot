//
//  RCNewViewController.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCNewViewController.h"

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
        [self setTitle:@"New View Controller"];
        [self.view setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:blockc(button,
                                 UIButton *button = [[UIButton alloc] initWithFrame:self.view.frame];
                                 [button setBackgroundColor:[UIColor blueColor]];
                                 button.tag = 1001;
                                 )];
    ((UIButton *)[self.view viewWithTag:1001]).rac_command = [[RACCommand alloc] initWithSignalBlock:^(id _) {
        [Bot start:kRCControllerPop];
        return [RACSignal empty];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
