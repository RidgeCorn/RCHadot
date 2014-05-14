//
//  RCModelTaskOptions.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCOptions.h"

static NSString *const kRCModelOptionsStorageTypeDisposable = @"__kRCModelOptionsStorageTypeDisposable__";

typedef NS_ENUM(NSUInteger, RCModelOptionsStorageType) {
    RCModelOptionsStorageTypeWrite,
    RCModelOptionsStorageTypeAppend,
    RCModelOptionsStorageTypeDisposable,
//    RCModelOptionsStorageTypeUpdate
};

@interface RCModelTaskOptions : RCOptions

@property (nonatomic) NSMutableDictionary *requestParams;
@property (nonatomic) NSMutableDictionary *modelsMapping;

@property (nonatomic) NSString *toCacheKey;

@property (nonatomic) RCModelOptionsStorageType storageType;

@end
