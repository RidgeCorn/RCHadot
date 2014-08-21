//
//  RCHTTPClient.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCHTTPClient.h"
#import "RCObject.h"
#import <NSString+RCAppConfig.h>

@implementation RCHTTPClient

+ (RCHTTPClient *)sharedClient {
    static RCHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[RCHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[NSString apiBaseHTTPURLString]]];
        [_sharedClient setUserAgent:[NSString userAgent]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    if (self = [super initWithBaseURL:url]) {

    }
    
    return self;
}

- (void)setUserAgent:(NSString *)userAgent {
    [self.requestSerializer setValue:userAgent forHTTPHeaderField:@"User-Agent"];
}

- (id)getPath:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *))failure {
    return [self GET:URLString parameters:parameters success:success failure:failure];
}

- (id)postPath:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *))failure {
    return [self POST:URLString parameters:parameters success:success failure:failure];
}

- (id)putPath:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *))failure {
    return [self PUT:URLString parameters:parameters success:success failure:failure];
}

- (id)deletePath:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(id, id))success failure:(void (^)(id, NSError *))failure {
    return [self DELETE:URLString parameters:parameters success:success failure:failure];
}

@end
