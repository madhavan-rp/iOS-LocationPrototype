//
//  ViewController.m
//  LocationPrototype
//
//  Created by Madhavan Rajagopal Padmanabhan on 18/06/13.
//  Copyright (c) 2013 NP Compete Technologies. All rights reserved.
//

#import "ViewController.h"
#import "RCLocationManager.h"
#import "TestFlight.h"
#import "FeedbackManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create location manager with filters set for battery efficiency.
    RCLocationManager *locationManager = [RCLocationManager sharedManager];
    [locationManager setPurpose:@"My custom purpose message"];
    [locationManager setUserDistanceFilter:kCLLocationAccuracyHundredMeters];
    [locationManager setUserDesiredAccuracy:kCLLocationAccuracyBest];
    
    // Start updating location changes.
    [locationManager startUpdatingLocationWithBlock:^(CLLocationManager *manager, CLLocation *newLocation, CLLocation *oldLocation) {
        TFLog(@"Speed is %f m/s",[newLocation speed]);
        NSLog(@"Old Location: %@",[oldLocation description]);
        NSLog(@"New Location: %@",[newLocation description]);
        NSLog(@"Updated location using block.");
        if (oldLocation) {
            [FeedbackManager giveMessage:@"Some Feedback"];
        }
        
    } errorBlock:^(CLLocationManager *manager, NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}

- (void)viewDidUnload {
    
    [[RCLocationManager sharedManager] stopUpdatingLocation];
    [[RCLocationManager sharedManager] stopMonitoringAllRegions];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
