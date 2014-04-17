//
//  RCDisplay.h
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCDisplay : RCObject

+ (void)displayData:(NSDictionary *)dict inView:(id)view withMapping:(NSDictionary *)mapping;

@end
