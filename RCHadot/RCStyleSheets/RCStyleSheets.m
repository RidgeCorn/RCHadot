//
//  RCStyleSheets.m
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCStyleSheets.h"
#import "NSString+RCString.h"

@implementation RCStyleSheets

+ (void)init {
    [NUISettings init];
}

+ (void)initWithThemeKey:(NSString *)themeKey {
    [NUISettings initWithStylesheet:themeKey];
}

+ (void)updateThemeWithKey:(NSString *)themeKey {
    [NUISettings appendStylesheet:themeKey];
}

+ (void)reloadTheme {
    [NUISettings reloadStylesheetsOnOrientationChange:UIInterfaceOrientationLandscapeLeft];
}

+ (NSString *)genStyleClassInView:(id)view withNames:(NSArray *)styleNames {
    returnc(styleClass,
            NSString *styleClass = nil;
            if ([view isKindOfClass:[UIBarButtonItem class]]) {
                styleClass = [self barButtonItemStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIButton class]]) {
                styleClass = [self buttonStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UISegmentedControl class]]) {
                styleClass = [self segmentedControlStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UISlider class]]) {
                styleClass = [self sliderStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UISwitch class]]) {
                styleClass = [self switchStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITextField class]]) {
                styleClass = [self textFieldStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIControl class]]) {
                styleClass = [self controlStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UILabel class]]) {
                styleClass = [self labelStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UINavigationBar class]]) {
                styleClass = [self navigationBarStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UINavigationItem class]]) {
                styleClass = [self navigationItemStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIProgressView class]]) {
                styleClass = [self progressStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UISearchBar class]]) {
                styleClass = [self searchBarStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITabBar class]]) {
                styleClass = [self tabBarStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITabBarItem class]]) {
                styleClass = [self tabBarItemStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITableView class]]) {
                styleClass = [self tableViewStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITableViewCell class]]) {
                styleClass = [self tableViewCellStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UITextView class]]) {
                styleClass = [self textViewStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIToolbar class]]) {
                styleClass = [self toolBarStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIWindow class]]) {
                styleClass = [self windowStyleClass:styleNames];
                
            } else if ([view isKindOfClass:[UIView class]]) {
                styleClass = [self viewStyleClass:styleNames];
            }
            );
}

+ (NSString *)barButtonItemStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIBarButtonItemStyleClass withNames:styleNames]);
}

+ (NSString *)buttonStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIButtonStyleClass withNames:styleNames]);
}

+ (NSString *)controlStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIControlStyleClass withNames:styleNames]);
}

+ (NSString *)labelStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUILabelStyleClass withNames:styleNames]);
}

+ (NSString *)navigationBarStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUINavigationBarStyleClass withNames:styleNames]);
}

+ (NSString *)navigationItemStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUINavigationItemStyleClass withNames:styleNames]);
}

+ (NSString *)progressStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIProgressStyleClass withNames:styleNames]);
}

+ (NSString *)searchBarStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUISearchBarStyleClass withNames:styleNames]);
}

+ (NSString *)segmentedControlStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUISegmentedControlStyleClass withNames:styleNames]);
}

+ (NSString *)sliderStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUISliderStyleClass withNames:styleNames]);
}

+ (NSString *)switchStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUISwitchStyleClass withNames:styleNames]);
}

+ (NSString *)tabBarStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITabBarStyleClass withNames:styleNames]);
}

+ (NSString *)tabBarItemStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITabBarItemStyleClass withNames:styleNames]);
}

+ (NSString *)tableViewStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITableViewStyleClass withNames:styleNames]);
}

+ (NSString *)tableViewCellStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITableViewCellStyleClass withNames:styleNames]);
}

+ (NSString *)textFieldStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITextFieldStyleClass withNames:styleNames]);
}

+ (NSString *)textViewStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUITextViewStyleClass withNames:styleNames]);
}

+ (NSString *)toolBarStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIToolbarStyleClass withNames:styleNames]);
}

+ (NSString *)viewStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIViewStyleClass withNames:styleNames]);
}

+ (NSString *)windowStyleClass:(NSArray *)styleNames {
    returnc([self combineStyleClass:kRCSSDefaultUIWindowStyleClass withNames:styleNames]);
}

+ (NSString *)combineStyleClass:(NSString *)className withNames:(NSArray *)names {
    returnc(className,
            for (NSString *name in names) {
                className = [className stringByAppendingString:name withSeparator:kRCSSDefaultUIStyleClassSeparator];
            }
            );
}

@end
