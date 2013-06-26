//
//  FeedbackManager.m
//  LocationPrototype
//
//  Created by Madhavan Rajagopal Padmanabhan on 26/06/13.
//  Copyright (c) 2013 NP Compete Technologies. All rights reserved.
//

#import "FeedbackManager.h"

@implementation FeedbackManager

+ (void)giveMessage:(NSString *)message {
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    localNotif.alertBody = [NSString stringWithString:message];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
}

@end
