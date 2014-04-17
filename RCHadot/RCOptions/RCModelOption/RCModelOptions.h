//
//  RCModelOptions.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014年 RidgeCorn. All rights reserved.
//

#import "RCOptions.h"

@interface RCModelOptions : RCOptions

@property (nonatomic) NSDictionary *requestParams;
@property (nonatomic) NSArray *cacheValuePaths;

@property (nonatomic) NSDictionary *requestKeyMapping;
@property (nonatomic) NSString *responseDataKeyPath;

@property (nonatomic) NSString *toCacheKey;

@end
