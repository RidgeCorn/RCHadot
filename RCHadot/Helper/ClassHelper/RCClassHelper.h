//
//  RCClassHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-28.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCClassHelper : RCObject

@property (nonatomic) Class cls;

+ (id)objectFromClass:(Class)cls;

@end
