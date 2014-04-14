//
//  RCViewTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCCache.h"
#import "RCTask.h"

typedef NS_ENUM(NSUInteger, RCViewTaskType) {
    RCViewTaskTypeAddToView = 0,
    RCViewTaskTypeRemoveFromSuperView,
    RCViewTaskTypeRemoveSubViews
};

@interface RCViewTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) NSArray *viewTags;
@property (nonatomic) Class viewClass;
@property (nonatomic) NSString *modelKey;
@property (nonatomic) RCViewTaskType type;
@property (nonatomic) id refsView;

@end
