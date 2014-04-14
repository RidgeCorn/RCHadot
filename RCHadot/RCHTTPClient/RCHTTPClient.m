//
//  RCHTTPClient.m
//  RCHadot
//
//  Created by Looping on 14-4-14.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import "RCAppConfig.h"
#import "RCHTTPClient.h"

@implementation RCHTTPClient

+ (RCHTTPClient *)sharedClient {
    returnc(_sharedClient,
            static RCHTTPClient *_sharedClient = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                _sharedClient = [[RCHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[RCAppConfig apiBaseHTTPURLString]]];
                [_sharedClient setUserAgent:[RCAppConfig userAgent]];
            });
    );
}

- (void)setUserAgent:(NSString *)userAgent {
    [self setDefaultHeader:@"User-Agent" value:userAgent];
}

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    
    if (! self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end
