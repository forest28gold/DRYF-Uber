//
//  AppDelegate.m
//  DRYF
//
//  Created by AppsCreationTech on 29/10/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "AppDelegate.h"
#import "HCBUIConfig.h"
#import "HCBLocationManager.h"

@import GoogleMaps;

#ifdef DEV
    static NSString *const kGoogleAPIKey = @"AIzaSyCB0qbNOcR6gzkNos4GmEiuOLb-SB_yw8U";
//    static NSString *const kAppseeKey = @"d89d23049390452380307a27e6486649";
#else
    static NSString *const kGoogleAPIKey = @"AIzaSyCB0qbNOcR6gzkNos4GmEiuOLb-SB_yw8U";
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    configureUIAppereance();

    [GMSServices provideAPIKey:kGoogleAPIKey];

    [[HCBLocationManager sharedManager] startUpdatingLocation];

    return YES;
}

-(void)applicationWillResignActive:(UIApplication *)application
{
    
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

-(void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
