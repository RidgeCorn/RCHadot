//
//  RCTask.m
//  RCHadot
//
//  Created by Looping on 14-3-31.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCTask.h"

@implementation RCTask

- (id)initWithKey:(NSString *)key {
    returnc(self,
            if (self = [super init]) {
                _key = key;
            }
            );
}

#pragma mark - NSCopying, NSCoding
- (instancetype)copyWithZone:(NSZone *)zone {
    return [NSKeyedUnarchiver unarchiveObjectWithData:
            [NSKeyedArchiver archivedDataWithRootObject:self]
            ];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    NSString *key = [decoder decodeObjectForKey:@"taskKey"];
    
    self = [self initWithKey:key];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.key forKey:@"taskKey"];
}
@end
