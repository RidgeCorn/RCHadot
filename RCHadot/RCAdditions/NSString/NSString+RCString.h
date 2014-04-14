//
//  NSString+RCString.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RCString)

- (NSString *)md5HexDigest;

- (NSString *)hashString;

- (NSString *)stringByTrimmingWhitespace;
- (NSString *)stringByTrimmingWhitespaceAndNewline;

@end
