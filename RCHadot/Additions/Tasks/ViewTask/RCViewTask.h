//
//  RCViewTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTask.h"
#import "RCViewTaskOptions.h"

typedef NS_ENUM(NSUInteger, RCViewTaskType) {
    RCViewTaskTypeAddToView = 0,
    RCViewTaskTypeRemoveFromSuperView,
    RCViewTaskTypeRemoveSubViews
};

@interface RCViewTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) Class viewClass;
@property (nonatomic) RCViewTaskType type;
@property (nonatomic) RCViewTaskOptions *options;

- (id)initWithKey:(NSString *)key Type:(RCViewTaskType)type refsView:(id)view viewClass:(Class)viewClass options:(RCViewTaskOptions *)options;

@end
