//
//  UIView+RCView.m
//  RCHadot
//
//  Created by Looping on 14/6/24.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "UIView+RCView.h"

@implementation UIView (RCView)

#pragma mark - Find UIViewController
- (UIViewController *) firstAvailableUIViewController {
    return (UIViewController *)[self traverseResponderChainForUIViewController];
}

- (id) traverseResponderChainForUIViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForUIViewController];
    } else {
        return nil;
    }
}

@end
