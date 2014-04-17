//
//  RCViewTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCCache.h"
#import "RCTask.h"
#import "RCViewOptions.h"

typedef NS_ENUM(NSUInteger, RCViewTaskType) {
    RCViewTaskTypeAddToView = 0,
    RCViewTaskTypeRemoveFromSuperView,
    RCViewTaskTypeRemoveSubViews
};

@interface RCViewTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) NSArray *viewTags;
@property (nonatomic) Class viewClass;
@property (nonatomic) NSString *mappingCollectionKey;
@property (nonatomic) NSArray *cacheValuePaths;
@property (nonatomic) NSString *viewInitMethod;
@property (nonatomic) RCViewTaskType type;
@property (nonatomic) id refsView;
@property (nonatomic) RCViewOptions *options;

- (id)initWithKey:(NSString *)key Type:(RCViewTaskType)type refsView:(id)refsView viewClass:(Class)viewClass viewInitMethod:(NSString *)viewInitMethod viewTags:(NSArray *)viewTags cacheValuePaths:(NSArray *)cacheValuePaths mappingCollectionKey:(NSString *)mappingCollectionKey options:(RCViewOptions *)options;

@end
