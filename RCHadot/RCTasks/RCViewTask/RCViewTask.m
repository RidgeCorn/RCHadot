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

@implementation RCViewTask

- (id)initWithKey:(NSString *)key {
    returnc(self,
            if(self = [super initWithKey:key]) {
                self.delegate = self;
            });
}

- (id)initWithKey:(NSString *)key Type:(RCViewTaskType)type refsView:(id)refsView viewClass:(Class)viewClass viewInitMethod:(NSString *)viewInitMethod viewTags:(NSArray *)viewTags cacheValuePaths:(NSArray *)cacheValuePaths mappingCollectionKey:(NSString *)mappingCollectionKey options:(RCViewOptions *)options {
    returnc(self,
            if (self = [self initWithKey:key]) {
                _type = type;
                _refsView = refsView;
                _viewClass = viewClass;
                _viewInitMethod = viewInitMethod;
                _viewTags = viewTags;
                _cacheValuePaths = cacheValuePaths;
                _mappingCollectionKey = mappingCollectionKey;
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
            SEL VIEW_INIT_SELECTOR = sel_registerName(_viewInitMethod ? [_viewInitMethod UTF8String ]: "initWithOptions:");
            id view = nil;
            
            if (task.viewClass) {
                view = [(task.viewClass) alloc];
            }
            
            if (_refsView && [view respondsToSelector:VIEW_INIT_SELECTOR]) {
                NSInteger tag = 0;
                
                if ([_viewTags count]) {
                    tag = [_viewTags[0] integerValue];
                }
                
                id tmpView = nil;
                
                if (tag && (tmpView = [_refsView viewWithTag:tag])) {
                    [tmpView removeFromSuperview];
                }
                
                [_refsView addSubview: [view performSelector:VIEW_INIT_SELECTOR withObject: _options]];

                if (tag) {
                    [view setTag:[_viewTags[0] integerValue]];
                }
                
                [RCDisplay displayData:[RCCache dictInCacheWithCachePaths:_cacheValuePaths] inView:view withMapping:[Mapping collectionForKey:_mappingCollectionKey]];
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
            if (_viewTags && _refsView) {
                for (NSNumber *tag in _viewTags) {
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
