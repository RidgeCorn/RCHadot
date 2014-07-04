//
//  RCPlayerHelper.h
//  RCHadot
//
//  Created by Looping on 14/7/2.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"
#import <AudioToolbox/AudioToolbox.h>

@interface RCPlayerHelper : RCObject

+ (void)playSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;
+ (void)playCustomSoundWithName:(NSString *)soundName;

+ (void)vibratePlay;

@end
