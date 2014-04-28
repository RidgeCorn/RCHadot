//
//  RCViewTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCViewTask.h"
#import "RCBot.h"
#import "RCMappingHelper.h"
#import "RCDisplayHelper.h"
#import "RCStyleSheetsHelper.h"
#import "RCModelHelper.h"
#import "RCModelTask.h"

@implementation RCViewTask

- (id)initWithCoder:(NSCoder *)aDecoder {
    NSString *key = [aDecoder decodeObjectForKey:@"key"];
    
    if(self = [self initWithKey:key]) {
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.key forKey:@"key"];
}

- (id)initWithKey:(NSString *)key {
    if(self = [super initWithKey:key]) {
        self.delegate = self;
    }
    return self;
}

- (id)initWithKey:(NSString *)key Type:(RCViewTaskType)type refsView:(id)refsView viewClass:(Class)viewClass options:(RCViewTaskOptions *)options {
    if (self = [self initWithKey:key]) {
        _type = type;
        _refsView = refsView;
        _viewClass = viewClass;
        _options = options;
    }
    return self;
}

- (BOOL)handleStart:(RCViewTask *)task {
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
                
                RCModelTask *modelTask = (RCModelTask *)[Bot taskForKey:_options.bindModelTaskKey];
                
                NSArray *allModelKeys = [modelTask.options.modelsMapping allKeys];
                NSMutableDictionary *modelsDict = [@{} mutableCopy];
                
                for (NSString *modelKey in allModelKeys) {
                    [modelsDict setObject:[modelTask modelWithKey:modelKey] forKey:modelKey];
                }
                
                _options.models = modelsDict;
                
                [_refsView addSubview: [view performSelector:VIEW_INIT_SELECTOR withObject: _options]];

                if (tag) {
                    [view setTag:[_options.viewTags[0] integerValue]];
                }
                
                if (_options.styleSheetsKey) {
                    [view setNuiClass:_options.styleSheetsKey];
                }
                
                [RCDisplayHelper displayData:[RCCacheHelper dictInCacheWithCachePaths:_options.cacheValuePaths] inView:view withMapping:[RCMappingHelper collectionForKey:_options.mappingCollectionKey]];
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

    return YES;
}

@end
