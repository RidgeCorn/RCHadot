//
//  RCStyleSheets.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import <UIBarButtonItem+NUI.h>
#import <UIButton+NUI.h>
#import <UIControl+NUI.h>
#import <UILabel+NUI.h>
#import <UINavigationBar+NUI.h>
#import <UINavigationItem+NUI.h>
#import <UIProgressView+NUI.h>
#import <UISearchBar+NUI.h>
#import <UISegmentedControl+NUI.h>
#import <UISlider+NUI.h>
#import <UISwitch+NUI.h>
#import <UITabBar+NUI.h>
#import <UITabBarItem+NUI.h>
#import <UITableView+NUI.h>
#import <UITextField+NUI.h>
#import <UITextView+NUI.h>
#import <UIToolbar+NUI.h>
#import <UIView+NUI.h>
#import <UIWindow+NUI.h>

static NSString * const kRCSSDefaultUIStyleClassSeparator = @":";

static NSString * const kRCSSDefaultUIBarButtonItemStyleClass = @"BarButton";
static NSString * const kRCSSDefaultUIButtonStyleClass = @"Button";
static NSString * const kRCSSDefaultUIControlStyleClass = @"Control";
static NSString * const kRCSSDefaultUILabelStyleClass = @"Label";
static NSString * const kRCSSDefaultUINavigationBarStyleClass = @"NavigationBar";
static NSString * const kRCSSDefaultUINavigationItemStyleClass = @"NavigationItem";
static NSString * const kRCSSDefaultUIProgressStyleClass = @"Progress";
static NSString * const kRCSSDefaultUISearchBarStyleClass = @"SearchBar";
static NSString * const kRCSSDefaultUISegmentedControlStyleClass = @"SegmentedControl";
static NSString * const kRCSSDefaultUISliderStyleClass = @"Slider";
static NSString * const kRCSSDefaultUISwitchStyleClass = @"Switch";
static NSString * const kRCSSDefaultUITabBarStyleClass = @"TabBar";
static NSString * const kRCSSDefaultUITabBarItemStyleClass = @"TabBarItem";
static NSString * const kRCSSDefaultUITableViewStyleClass = @"Table";
static NSString * const kRCSSDefaultUITableViewCellStyleClass = @"TableCell";
static NSString * const kRCSSDefaultUITextFieldStyleClass = @"TextField";
static NSString * const kRCSSDefaultUITextViewStyleClass = @"TextView";
static NSString * const kRCSSDefaultUIToolbarStyleClass = @"Toolbar";
static NSString * const kRCSSDefaultUIViewStyleClass = @"View";
static NSString * const kRCSSDefaultUIWindowStyleClass = @"Window";

@interface RCStyleSheets : RCObject

+ (void)init;

+ (void)initWithThemeKey:(NSString *)themeKey;

+ (void)updateThemeWithKey:(NSString *)themeKey;

+ (void)reloadTheme;

+ (NSString *)genStyleClassInView:(id)view withNames:(NSArray *)styleNames;

+ (NSString *)barButtonItemStyleClass:(NSArray *)styleNames;
+ (NSString *)buttonStyleClass:(NSArray *)styleNames;
+ (NSString *)controlStyleClass:(NSArray *)styleNames;
+ (NSString *)labelStyleClass:(NSArray *)styleNames;
+ (NSString *)navigationBarStyleClass:(NSArray *)styleNames;
+ (NSString *)navigationItemStyleClass:(NSArray *)styleNames;
+ (NSString *)progressStyleClass:(NSArray *)styleNames;
+ (NSString *)searchBarStyleClass:(NSArray *)styleNames;
+ (NSString *)segmentedControlStyleClass:(NSArray *)styleNames;
+ (NSString *)sliderStyleClass:(NSArray *)styleNames;
+ (NSString *)switchStyleClass:(NSArray *)styleNames;
+ (NSString *)tabBarStyleClass:(NSArray *)styleNames;
+ (NSString *)tabBarItemStyleClass:(NSArray *)styleNames;
+ (NSString *)tableViewStyleClass:(NSArray *)styleNames;
+ (NSString *)tableViewCellStyleClass:(NSArray *)styleNames;
+ (NSString *)textFieldStyleClass:(NSArray *)styleNames;
+ (NSString *)textViewStyleClass:(NSArray *)styleNames;
+ (NSString *)toolBarStyleClass:(NSArray *)styleNames;
+ (NSString *)viewStyleClass:(NSArray *)styleNames;
+ (NSString *)windowStyleClass:(NSArray *)styleNames;

@end
