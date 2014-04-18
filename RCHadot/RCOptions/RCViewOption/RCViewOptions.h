//
//  RCViewOptions.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCOptions.h"

@interface RCViewOptions : RCOptions

@property (nonatomic) CGRect frame;

@property (nonatomic) NSString *mappingCollectionKey;
@property (nonatomic) NSArray *cacheValuePaths;
@property (nonatomic) NSString *viewInitMethod;
@property (nonatomic) NSArray *viewTags;
@property (nonatomic) NSString *styleSheetsKey;

@end
