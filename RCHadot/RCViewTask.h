//
//  RCViewTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCHadot.h"

typedef NS_ENUM(NSUInteger, RCViewTaskType) {
    RCViewTaskTypeAddToView = 0,
    RCViewTaskTypeAddSubViews,
    RCViewTaskTypeRemoveViews,
    RCViewTaskTypeRemoveSubViews
};

@interface RCViewTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) Class viewClass;
@property (nonatomic) NSArray *modelData;
@property (nonatomic) RCViewTaskType type;
@property (nonatomic) id superView;

@end
