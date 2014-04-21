//
//  RCDisplayHelperSpec.m
//  RCHadot
//
//  Created by Looping on 14-4-16.
//  Copyright 2014    RidgeCorn. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "RCDisplayHelper.h"


SPEC_BEGIN(RCDisplayHelperSpec)

describe(@"RCDisplayHelper", ^{
    context(@"when test displayData 'username: looping' inView 'UILabel' withMapping 'username: text'", ^{
        it(@"should be done", ^{
            UILabel *nameLabel = [[UILabel alloc] init];
            NSString *username = @"looping";
            NSDictionary *displayDict = @{@"username": username};
            NSDictionary *mappingDict = @{@"username": @"text"};
            [RCDisplayHelper displayData:displayDict inView:nameLabel withMapping:mappingDict];
            
            [[nameLabel.text should] equal:username];
        });
    });
});

SPEC_END
