//
//  RCLogger.h
//  RCHadot
//
//  Created by Looping on 14-4-23.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#ifndef RC_LOGGER_ENABLE

    #ifdef DEBUG
        #define RC_LOGGER_ENABLE 1

    #else
        #define RC_LOGGER_ENABLE 0

    #endif
#endif

#if RC_LOGGER_ENABLE != 0

    #ifdef LOG_VERBOSE
        extern int ddLogLevel;
        #define RCLog(...)  DDLogVerbose(__VA_ARGS__)

    #else
        #define RCLog(...) NSLog(@"\n\n==========\tRCLog Begin\t==========\n\nFile:\t\t%s\nMethod:\t%s\nLine:\t\t%d\nMem:\t\t%p\n\nInfo:\n----------\tInfo Begin\t----------\n%@\n----------\tInfo End\t----------\n\n==========\tRCLog End\t==========\n\n", __FILE__, __PRETTY_FUNCTION__, __LINE__, self, [NSString stringWithFormat:__VA_ARGS__])

    #endif
#else
    #define RCLog(...) ((void)0)

#endif

@interface RCLogger : RCObject

@end
