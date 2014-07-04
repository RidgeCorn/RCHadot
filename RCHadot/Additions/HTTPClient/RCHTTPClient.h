//
//  RCHTTPClient.h
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import <AFHTTPRequestOperationManager.h>
#import "RCHTTPClient.h"

#ifndef HTTPClient
#define HTTPClient [RCHTTPClient sharedClient]
#endif

@interface RCHTTPClient : AFHTTPRequestOperationManager

+ (RCHTTPClient *)sharedClient;

- (void)setUserAgent:(NSString *)userAgent;

- (id)getPath:(NSString *)URLString
     parameters:(NSDictionary *)parameters
        success:(void (^)(id, id ))success
        failure:(void (^)(id, NSError *))failure;

- (id)postPath:(NSString *)URLString
      parameters:(NSDictionary *)parameters
         success:(void (^)(id, id ))success
         failure:(void (^)(id, NSError *))failure;

- (id)putPath:(NSString *)URLString
     parameters:(NSDictionary *)parameters
        success:(void (^)(id, id ))success
        failure:(void (^)(id, NSError *))failure;

- (id)deletePath:(NSString *)URLString
        parameters:(NSDictionary *)parameters
           success:(void (^)(id, id ))success
           failure:(void (^)(id, NSError *))failure;

@end
