//
//  RCLevelDB.m
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCLevelDB.h"

@implementation RCLevelDB

+ (instancetype)sharedLevelDBWithName:(NSString *)filename {
    static id ldb;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        ldb = [self databaseInLibraryWithName:filename];
    });
    
    return ldb;
}

@end
