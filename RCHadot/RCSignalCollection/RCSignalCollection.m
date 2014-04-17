//
//  RCSignalCollection.m
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCSignalCollection.h"

@interface RCSignalCollection ()

@property (nonatomic) NSMutableDictionary *collection;

@end

@implementation RCSignalCollection

+ (RCSignalCollection *)sharedCollection {
    returnc(_sharedCollection,
            static RCSignalCollection *_sharedCollection = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
            _sharedCollection = [[RCSignalCollection alloc] init];
            _sharedCollection.collection = [@{} mutableCopy];
            });
            );
}

- (void)addSignal:(id)signal withKey:(NSString *)key {
    [self.collection setObject:signal forKey:key];
}

- (id)signalWithKey:(NSString *)key {
    return [_collection objectForKey:key];
}

@end
