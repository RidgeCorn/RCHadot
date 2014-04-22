//
//  RCMTLModelTest.h
//  RCHadot
//
//  Created by Looping on 14-4-22.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Mantle.h>
#import "MTLModel.h"

@interface RCMTLModelTest : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *name;

@end
