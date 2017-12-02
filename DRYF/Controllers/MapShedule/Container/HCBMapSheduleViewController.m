//
//  HCBMapSheduleViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBMapSheduleViewController.h"

#import <UIViewController+MMDrawerController.h>

@interface HCBMapSheduleViewController ()

@end

@implementation HCBMapSheduleViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Actions

-(IBAction)menuButtonClicked:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft
                                      animated:YES
                                    completion:nil];
}

@end
