//
//  RCMapping.h
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#define Mapping [RCMapping sharedMapping]

@interface RCMapping : RCObject

+ (RCMapping *)sharedMapping;

- (id)collectionForKey:(NSString *)key;

- (void)addCollection:(NSMutableDictionary *)dict withKey:(NSString *)key;

- (void)setValue:(id)value forKey:(NSString *)key withCollectionKey:(NSString *)collectionKey;

- (id)valueForKey:(NSString *)key withCollectionKey:(NSString *)collectionKey;

@end
