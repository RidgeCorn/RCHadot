//
//  RCViewTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCViewTask.h"
#import "RCBot.h"
#import "RCMapping.h"
#import "RCDisplay.h"
#import "RCStyleSheets.h"

@implementation RCViewTask

- (id)initWithKey:(NSString *)key {
    returnc(self,
            if(self = [super initWithKey:key]) {
                self.delegate = self;
            });
}

- (id)initWithKey:(NSString *)key Type:(RCViewTaskType)type refsView:(id)refsView viewClass:(Class)viewClass options:(RCViewOptions *)options {
    returnc(self,
            if (self = [self initWithKey:key]) {
                _type = type;
                _refsView = refsView;
                _viewClass = viewClass;
                _options = options;
            }
    );
}

- (void)handleStart:(NSString *)taskKey {
    RCViewTask *task = [Bot taskForKey:taskKey];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    switch (task.type) {
        case RCViewTaskTypeAddToView: {
            SEL VIEW_INIT_SELECTOR = sel_registerName(_options.viewInitMethod ? [_options.viewInitMethod UTF8String ]: "initWithOptions:");
            id view = nil;
            
            if (task.viewClass) {
                view = [(task.viewClass) alloc];
            }
            
            if (_refsView && [view respondsToSelector:VIEW_INIT_SELECTOR]) {
                NSInteger tag = 0;
                
                if ([_options.viewTags count]) {
                    tag = [_options.viewTags[0] integerValue];
                }
                
                id tmpView = nil;
                
                if (tag && (tmpView = [_refsView viewWithTag:tag])) {
                    [tmpView removeFromSuperview];
                }
                
                [_refsView addSubview: [view performSelector:VIEW_INIT_SELECTOR withObject: _options]];

                if (tag) {
                    [view setTag:[_options.viewTags[0] integerValue]];
                }
                
                if (_options.styleSheetsKey) {
                    [view setNuiClass:_options.styleSheetsKey];
                }
                
                [RCDisplay displayData:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths] inView:view withMapping:[Mapping collectionForKey:_options.mappingCollectionKey]];
                }
        }
            break;
            
        case RCViewTaskTypeRemoveFromSuperView: {
            if (_refsView) {
                [_refsView removeFromSuperview];
            }
        }
            break;
            
        case RCViewTaskTypeRemoveSubViews: {
            if (_options.viewTags && _refsView) {
                for (NSNumber *tag in _options.viewTags) {
                    [[_refsView viewWithTag:[tag integerValue]] removeFromSuperview];
                }
            }
        }
            break;
            
        default:
            break;
    }
#pragma clang diagnostic pop

}

@end
