//
//  RCModelTaskOptions.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCOptions.h"

typedef NS_ENUM(NSUInteger, RCModelOptionsStorageType) {
    RCModelOptionsStorageTypeWrite,
    RCModelOptionsStorageTypeAppend,
//    RCModelOptionsStorageTypeUpdate
};

@interface RCModelTaskOptions : RCOptions

@property (nonatomic) NSDictionary *requestParams;
@property (nonatomic) NSArray *cacheValuePaths;

@property (nonatomic) NSDictionary *requestKeyMapping;
@property (nonatomic) NSString *responseDataKeyPath;
@property (nonatomic) NSString *toCacheKey;

@property (nonatomic) Class toModelClass;
@property (nonatomic) Class toModelsClass;

@property (nonatomic) RCModelOptionsStorageType storageType;

@end
