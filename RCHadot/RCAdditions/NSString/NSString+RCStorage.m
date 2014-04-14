//
//  NSString+RCStorage.m
//  RCHadot
//
//  Created by Looping on 14-4-9.
//
//  The MIT License (MIT)
//  Copyright (c) 2014 Looping, Ridgecorn
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


#import "NSString+RCStorage.h"

@implementation NSString (RCStorage)

- (NSString *)convertFromUnderscoreCaseToCamelCase {
    return ({
        NSString *convertedString;
        
        [(convertedString = [[self capitalizedString] stringByReplacingOccurrencesOfString:@"_" withString:@""]) length]
        ? [convertedString stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                                   withString:[[convertedString substringToIndex:1] lowercaseString]]
        : self;
    });
}

- (NSString *)convertFromCamelCaseToUnderscoreCase {
    return ({
        NSMutableString *convertedString = [self mutableCopy];
        NSRange upperCharRange;
        
        while ((upperCharRange
                = [convertedString rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]]
                ).location != NSNotFound) {
            [convertedString replaceCharactersInRange:upperCharRange
                                           withString:[NSString stringWithFormat:@"_%@", [[convertedString substringWithRange:upperCharRange] lowercaseString]]];
        }
        
        NSRange digitsRange;
        NSRange digitsRangeEnd = NSMakeRange(0, 0);
        while ((digitsRange
                = [convertedString rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]
                                                   options:kNilOptions
                                                     range:NSMakeRange(digitsRangeEnd.location + 1, convertedString.length - digitsRangeEnd.location - 1)]
                ).location != NSNotFound) {
            NSRange replaceRange = NSMakeRange(
                                               digitsRange.location
                                               , (digitsRangeEnd
                                                  = ( (digitsRangeEnd
                                                       = [convertedString rangeOfString:@"\\D"
                                                                                options:NSRegularExpressionSearch
                                                                                  range:NSMakeRange(digitsRange.location, convertedString.length - digitsRange.location)]
                                                       ).location == NSNotFound)
                                                  ? NSMakeRange(convertedString.length, 1)
                                                  : digitsRangeEnd
                                                  ).location - digitsRange.location
                                               );
            
            [convertedString replaceCharactersInRange:replaceRange
                                           withString:[NSString stringWithFormat:@"_%@", [convertedString substringWithRange:replaceRange]]];
        }
        
        convertedString;
    });
}

@end
