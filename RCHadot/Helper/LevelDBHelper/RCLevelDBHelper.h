//
//  RCLevelDBHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import "RCLevelDB.h"

static NSString * const RCLevelDBSharedName = @"RCLevelDBShared.ldb";

#define RCLDB [RCLevelDB sharedLevelDBWithName:RCLevelDBSharedName]


@interface RCLevelDBHelper : RCObject

@end
