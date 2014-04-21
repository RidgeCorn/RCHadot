//
//  NSManagedObject+RCStorageHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-8.
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

#import "NSManagedObject+RCStorage.h"

@implementation NSManagedObject (RCStorage)

- (void)updateFromDictionary:(NSDictionary *)dict dateFormatter:(NSDateFormatter *)dateFormatter withMapping:(NSDictionary *)mapping {
    if ([dict isKindOfClass:[NSDictionary class]]) {
        NSDictionary *attributes = [[self entity] attributesByName];
        
        for (NSString *attribute in attributes) {
            NSString *key = [mapping objectForKey:attribute];
            id value = nil;
            
            if (key) {
                NSArray *keyPath = [key componentsSeparatedByString:@"."];
                NSInteger cnt = [keyPath count];
                NSDictionary *tmpDict = [NSDictionary dictionaryWithDictionary:dict];
                NSInteger index = 0;
                
                for (; index < cnt - 1; index ++) {
                    tmpDict = [tmpDict objectForKey:keyPath[index]];
                }
                
                value = [tmpDict objectForKey:keyPath[index]];

            } else {
                value = [dict objectForKey:attribute];
            }
            
            if (value == nil) {
                continue;
            }
            
            NSAttributeType attributeType = [[attributes objectForKey:attribute] attributeType];
 
            switch (attributeType) {
                case NSInteger16AttributeType:
                case NSInteger32AttributeType:
                case NSInteger64AttributeType: {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [NSNumber numberWithInteger:[value integerValue]];
                    }
                    break;
                }
                case NSDecimalAttributeType: {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [[NSDecimalNumber alloc] initWithString:value];
                    }
                    break;
                }
                case NSDoubleAttributeType: {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [NSNumber numberWithDouble:[value doubleValue]];
                    }
                    break;
                }
                case NSFloatAttributeType: {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [NSNumber numberWithFloat:[value floatValue]];
                    }
                    break;
                }
                case NSStringAttributeType: {
                    if ([value isKindOfClass:[NSNumber class]]) {
                        value = [value stringValue];
                    }
                    break;
                }
                case NSBooleanAttributeType: {
                    if ([value isKindOfClass:[NSString class]]) {
                        value = [NSNumber numberWithBool:[value boolValue]];
                    }
                    break;
                }
                case NSDateAttributeType: {
                    if (dateFormatter && [value isKindOfClass:[NSString class]]) {
                        value = [dateFormatter dateFromString:value];
                    }
                    break;
                }
                    
                case NSBinaryDataAttributeType:
                case NSTransformableAttributeType:
                case NSObjectIDAttributeType: {
                    break;
                }
                    
                case NSUndefinedAttributeType:
                default:
//                    NSLog(@"NSUndefinedAttributeType");
                    break;
            }
            
            [self setValue:value forKey:attribute];
        }
    }
}

- (void)updateFromDictionary:(NSDictionary *)dict withMapping:(NSDictionary *)mapping {
    [self updateFromDictionary:dict dateFormatter:nil withMapping:mapping];
}

- (void)updateFromDictionary:(NSDictionary *)dict dateFormatter:(NSDateFormatter *)dateFormatter {
    [self updateFromDictionary:dict dateFormatter:dateFormatter withMapping:nil];
}

- (void)updateFromDictionary:(NSDictionary *)dict {
    [self updateFromDictionary:dict dateFormatter:nil withMapping:nil];
}

- (void)updateFromData:(NSData *)data dateFormatter:(NSDateFormatter *)dateFormatter withMapping:(NSDictionary *)mapping {
    NSError *error = nil;
    
    id dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (error) {
        NSLog(@"Error: %@", error.description);
    } else {
        [self updateFromDictionary:dict dateFormatter:dateFormatter withMapping:mapping];
    }
}

- (void)updateFromData:(NSData *)data withMapping:(NSDictionary *)mapping {
    [self updateFromData:data dateFormatter:nil withMapping:mapping];
}

- (void)updateFromData:(NSData *)data dateFormatter:(NSDateFormatter *)dateFormatter {
    [self updateFromData:data dateFormatter:dateFormatter withMapping:nil];
}

- (void)updateFromData:(NSData *)data {
    [self updateFromData:data dateFormatter:nil withMapping:nil];
}

@end
