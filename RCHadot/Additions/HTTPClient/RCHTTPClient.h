//
//  RCHTTPClient.h
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <AFNetworking.h>
#import "RCHTTPClient.h"

#ifndef HTTPClient
#define HTTPClient [RCHTTPClient sharedClient]
#endif

@interface RCHTTPClient : AFHTTPClient

+ (RCHTTPClient *)sharedClient;

- (void)setUserAgent:(NSString *)userAgent;

@end
