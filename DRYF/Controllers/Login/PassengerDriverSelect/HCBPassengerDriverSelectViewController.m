//
//  HCBPassengerDriverSelectViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBPassengerDriverSelectViewController.h"
#import "HCBPhoneInputViewController.h"
#import "HCBAuthenticationManager.h"

#import <UINavigationController+FDFullscreenPopGesture.h>

@interface HCBPassengerDriverSelectViewController ()

@end

@implementation HCBPassengerDriverSelectViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.fd_prefersNavigationBarHidden = YES;

    [self.navigationController setNavigationBarHidden:YES];
}

#pragma mark - Actions

-(IBAction)passengerButtonClicked:(id)sender
{
    [HCBAuthenticationManager sharedManager].isDriverMode = NO;
    
    [self performSegueWithIdentifier:NSStringFromClass([HCBPhoneInputViewController class]) sender:self];
}

-(IBAction)driverButtonClicked:(id)sender
{
    [HCBAuthenticationManager sharedManager].isDriverMode = YES;
    
    [self performSegueWithIdentifier:NSStringFromClass([HCBPhoneInputViewController class]) sender:self];
}

@end
