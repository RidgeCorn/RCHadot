//
//  NSString+RCString.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSString+RCString.h"
#import "RCAppConfigHelper.h"
#import "RCCryptoHelper.h"

@implementation NSString (RCString)

- (NSString *)md5HexDigest {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    NSMutableString *md5String = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5String appendFormat:@"%02X", result[i]];
    }
    
    return [md5String lowercaseString];
}

- (NSString *)hashString {
    return [[self stringByAppendingFormat:@"%f", [NSDate timeIntervalSinceReferenceDate]] md5HexDigest];
}

- (NSString *)stringByTrimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewline {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
}

- (NSString *)stringByAppendingString:(NSString *)aString withSeparator:(NSString *)sString {
    return (aString && [aString length]) ? [self stringByAppendingFormat:@"%@%@", sString ?: @"", aString] : self;
}

@end
