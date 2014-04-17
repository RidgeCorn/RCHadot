//
//  NSDictionary+RCDictionary.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "NSDictionary+RCDictionary.h"

@implementation NSDictionary (RCDictionary)

- (id)valueForDotKeyPath:(NSString *)dotKeyPath {
    return [self valueForKeyPath:dotKeyPath separatedString:@"."];
}

- (id)valueForKeyPath:(NSString *)keyPath separatedString:(NSString *)separator {
    id value = nil;
    
    if (keyPath) {
        NSArray *keys = [keyPath componentsSeparatedByString:separator ?: @""];
        value = self;
        
        for (NSString *key in keys) {            
            if ( !(value = [value valueForKeyPath:key])) {
                break;
            }
        }
    }

    return value;
}

- (id)filterWithMapping:(NSDictionary *)mapping {
    NSMutableDictionary *params = [@{} mutableCopy];
    NSArray *allFilterKeys = [mapping allKeys];
    for (NSString *filterKey in allFilterKeys) {
        if ( ![self valueForKey:filterKey]) {
            //            NSLog(@"NO Request Key Found (%@)", filterKey);
        } else {
            [params setValue:[self valueForKey:filterKey] forKey:[mapping valueForKey:filterKey]];
        }
    }
    
    return params;
}

@end
