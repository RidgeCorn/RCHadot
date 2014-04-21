//
//  RCCryptoHelper.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

@interface RCCryptoHelper : RCObject

+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

@end
