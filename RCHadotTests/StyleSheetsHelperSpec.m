//
//  StyleSheetsHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCStyleSheetsHelper.h"

SPEC_BEGIN(RCStyleSheetsHelperSpec)

describe(@"RCStyleSheetsHelper", ^{
    context(@"when genStyleClassInView 'UIBarButtonItem' withName 'styleName'", ^{
        it(@"should return 'BarButton:styleName'", ^{
            UIBarButtonItem *barButtonItem = [UIBarButtonItem new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"BarButton:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:barButtonItem withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIButton' withName 'styleName'", ^{
        it(@"should return 'Button:styleName'", ^{
            UIButton *button = [UIButton new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Button:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:button withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIControl' withName 'styleName'", ^{
        it(@"should return 'Control:styleName'", ^{
            UIControl *control = [UIControl new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Control:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:control withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UILabel' withName 'styleName'", ^{
        it(@"should return 'Label:styleName'", ^{
            UILabel *label = [UILabel new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Label:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:label withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UINavigationBar' withName 'styleName'", ^{
        it(@"should return 'NavigationBar:styleName'", ^{
            UINavigationBar *navigationBar = [UINavigationBar new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"NavigationBar:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:navigationBar withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UINavigationItem' withName 'styleName'", ^{
        it(@"should return 'NavigationItem:styleName'", ^{
            UINavigationItem *navigationItem = [UINavigationItem new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"NavigationItem:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:navigationItem withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIProgressView' withName 'styleName'", ^{
        it(@"should return 'Progress:styleName'", ^{
            UIProgressView *progress = [UIProgressView new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Progress:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:progress withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UISearchBar' withName 'styleName'", ^{
        it(@"should return 'SearchBar:styleName'", ^{
            UISearchBar *searchBar = [UISearchBar new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"SearchBar:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:searchBar withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UISegmentedControl' withName 'styleName'", ^{
        it(@"should return 'SegmentedControl:styleName'", ^{
            UISegmentedControl *segmentedControl = [UISegmentedControl new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"SegmentedControl:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:segmentedControl withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UISlider' withName 'styleName'", ^{
        it(@"should return 'Slider:styleName'", ^{
            UISlider *slider = [UISlider new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Slider:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:slider withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UISwitch' withName 'styleName'", ^{
        it(@"should return 'Switch:styleName'", ^{
            UISwitch *theSwitch = [UISwitch new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Switch:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:theSwitch withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITabBar' withName 'styleName'", ^{
        it(@"should return 'TabBar:styleName'", ^{
            UITabBar *tabBar = [UITabBar new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"TabBar:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:tabBar withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITabBarItem' withName 'styleName'", ^{
        it(@"should return 'TabBarItem:styleName'", ^{
            UITabBarItem *tabBarItem = [UITabBarItem new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"TabBarItem:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:tabBarItem withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITableView' withName 'styleName'", ^{
        it(@"should return 'Table:styleName'", ^{
            UITableView *tableView = [UITableView new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Table:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:tableView withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITableViewCell' withName 'styleName'", ^{
        it(@"should return 'TableCell:styleName'", ^{
            UITableViewCell *tableViewCell = [UITableViewCell new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"TableCell:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:tableViewCell withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITextField' withName 'styleName'", ^{
        it(@"should return 'TextField:styleName'", ^{
            UITextField *textField = [UITextField new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"TextField:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:textField withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UITextView' withName 'styleName'", ^{
        it(@"should return 'TextView:styleName'", ^{
            UITextView *textView = [UITextView new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"TextView:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:textView withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIToolbar' withName 'styleName'", ^{
        it(@"should return 'Toolbar:styleName'", ^{
            UIToolbar *toolbar = [UIToolbar new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Toolbar:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:toolbar withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIView' withName 'styleName'", ^{
        it(@"should return 'View:styleName'", ^{
            UIView *view = [UIView new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"View:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:view withNames:@[styleName]] should] equal:styleClass];
        });
    });
    
    context(@"when genStyleClassInView 'UIWindow' withName 'styleName'", ^{
        it(@"should return 'Window:styleName'", ^{
            UIWindow *window = [UIWindow new];
            NSString *styleName = @"styleName";
            NSString *styleClass = @"Window:styleName";
            [[[RCStyleSheetsHelper genStyleClassInView:window withNames:@[styleName]] should] equal:styleClass];
        });
    });
});

SPEC_END
