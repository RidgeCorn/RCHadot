//
//  RCModelTask.h
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCHadot.h"

typedef NS_ENUM(NSUInteger, RCModelTaskType) {
    RCModelTaskTypeLoadFromServer,
    RCModelTaskTypeLoadFromCache,
    RCModelTaskTypeLoadFromDatabase,
    RCModelTaskTypeSendToServer
};

@interface RCModelTask : RCTask <RCTaskHandleDelegate>

@property (nonatomic) NSArray *fromModelsClass;
@property (nonatomic) NSArray *toModelsClass;
@property (nonatomic) RCModelTaskType type;
@property (nonatomic) BOOL cacheData;
@property (nonatomic) BOOL saveData;

@end
