//
//  RCMapping.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCMapping.h"

@interface RCMapping ()

@property (nonatomic) NSMutableDictionary *collections;

@end

@implementation RCMapping

+ (RCMapping *)sharedMapping {
    returnc(_sharedMapping,
            static RCMapping *_sharedMapping = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
            _sharedMapping = [[RCMapping alloc] init];
            _sharedMapping.collections = [@{} mutableCopy];
            });
            );
}

- (id)collectionForKey:(NSString *)key {
    return [_collections valueForKey:key];
}

- (void)addCollection:(NSMutableDictionary *)dict withKey:(NSString *)key {
    [_collections setValue:dict forKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key withCollectionKey:(NSString *)collectionKey {
    NSMutableDictionary *collection = [Mapping collectionForKey:collectionKey];
    
    if (collection && [collection isKindOfClass:[NSMutableDictionary class]]) {
        [collection setValue:value forKey:key];
    } else {
        if ( !collection) {
            collection = [@{} mutableCopy];
        }
        
        NSMutableDictionary *dict = [collection mutableCopy];

        [dict setValue:value forKey:key];
        
        [Mapping addCollection:dict withKey:collectionKey];
    }
}

- (id)valueForKey:(NSString *)key withCollectionKey:(NSString *)collectionKey {
    return [[Mapping collectionForKey:collectionKey] valueForKey:key];
}

@end
