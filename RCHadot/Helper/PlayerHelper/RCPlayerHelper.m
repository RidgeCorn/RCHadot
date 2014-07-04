//
//  RCPlayerHelper.m
//  RCHadot
//
//  Created by Looping on 14/7/2.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCPlayerHelper.h"

@implementation RCPlayerHelper

+ (void)vibratePlay {
    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
}

+ (void)playSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType {
    SystemSoundID theSoundID = kSystemSoundID_Vibrate;
    
    NSString *path = [[NSBundle bundleWithIdentifier:@"com.apple.UIKit"] pathForResource:soundName ofType:soundType];
    if (path) {
        OSStatus error =  AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &theSoundID);
        if (error != kAudioServicesNoError) {
            NSLog(@"Failed to create sound ");
        }
    }
    
    AudioServicesPlaySystemSound(theSoundID);
}

+ (void)playCustomSoundWithName:(NSString *)soundName {
    SystemSoundID theSoundID = kSystemSoundID_Vibrate;
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
    if (fileURL != nil)
    {
        OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileURL, &theSoundID);
        if (error != kAudioServicesNoError){
            NSLog(@"Failed to create sound ");
        }
    }
    
    AudioServicesPlayAlertSound(theSoundID);
}

@end
