//
//  RCLevelDB.h
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "LevelDB.h"

@interface RCLevelDB : LevelDB

+ (instancetype)sharedLevelDBWithName:(NSString *)filename; // Just filename, not path!

@end
