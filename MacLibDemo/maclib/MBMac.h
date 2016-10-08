//
//  MBPinger.h
//  MBMacAddress
//
//  Created by Mingbao on 7/21/16.
//  Copyright © 2016 qiyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBMac;

#define startPinging sync
#define stopPinging  suncComplete


typedef void(^MBMacComplete)(MBMac *mac, NSString *macAddr, NSTimeInterval time);
typedef void(^MBMacFailed)(MBMac *mac, NSError *error);

@interface MBMac : NSObject

@property (nonatomic, copy, readonly) NSString *host;

@property (nonatomic, assign) NSUInteger averageNumberOfPings;

@property (nonatomic, assign) NSTimeInterval pingWaitTime;

- (id)initWithHost: (NSString *) host;

- (void)sync;

- (void)syncComplete;

- (void) addCompleteCallback: (MBMacComplete) complete;
- (void) addFailedCallback: (MBMacFailed) failed;

@end
