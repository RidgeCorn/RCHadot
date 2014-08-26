//
//  RCTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTask.h"

@implementation RCTask
- (id)initWithKey:(NSString *)key refsByObject:(id)object {
    if (self = [super init]) {
        _key = key;
        _refsObj = object;
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key {
    if (self = [super init]) {
        _key = key;
    }
    
    return self;
}

- (id)initWithKey:(NSString *)key runBlock:(RCTaskBlock)runBlock {
    if (self = [super init]) {
        _key = key;
        _runBlock = runBlock;
    }
    
    return self;
}

#pragma mark - NSCopying, NSCoding
- (instancetype)copyWithZone:(NSZone *)zone {
    return [NSKeyedUnarchiver unarchiveObjectWithData:
            [NSKeyedArchiver archivedDataWithRootObject:self]
            ];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self.key = [decoder decodeObjectForKey:@"key"];
    self.state = [[decoder decodeObjectForKey:@"state"] integerValue];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_key forKey:@"key"];
    [encoder encodeObject:@(_state) forKey:@"state"];
}

- (void)handleStateBlock:(RCTaskBlock)stateBlock {
    _stateBlock = stateBlock;
}

- (void)resetRunBlock:(RCTaskBlock)runBlock {
    _runBlock = runBlock;
}
@end
