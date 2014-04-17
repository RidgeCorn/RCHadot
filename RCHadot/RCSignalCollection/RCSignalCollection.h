//
//  RCSignalCollection.h
//  RCHadot
//
//  Created by Looping on 14-4-17.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCObject.h"

#define SignalCollection [RCSignalCollection sharedCollection]

@interface RCSignalCollection : RCObject

+ (RCSignalCollection *)sharedCollection;

- (void)addSignal:(id)signal withKey:(NSString *)key;

- (id)signalWithKey:(NSString *)key;

@end
