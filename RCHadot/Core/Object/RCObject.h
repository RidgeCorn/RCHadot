//
//  RCObject.h
//  RCHadot
//
//  Created by Looping on 14-3-29.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define blockc(value, ...) ({ __VA_ARGS__;value;})

#define returnc(value, ...) return blockc(value, __VA_ARGS__)

@interface RCObject : NSObject

@end
