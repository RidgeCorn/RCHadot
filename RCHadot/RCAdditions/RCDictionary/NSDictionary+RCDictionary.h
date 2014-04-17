//
//  NSDictionary+RCDictionary.h
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (RCDictionary)

- (id)valueForDotKeyPath:(NSString *)dotKeyPath; //for dict

- (id)valueForKeyPath:(NSString *)keyPath separatedString:(NSString *)separator;

- (id)filterWithMapping:(NSDictionary *)mapping;

@end
