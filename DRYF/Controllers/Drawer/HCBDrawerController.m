//
//  HCBDrawerController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBDrawerController.h"

#import <UINavigationController+FDFullscreenPopGesture.h>

@interface HCBDrawerController ()

@end

@implementation HCBDrawerController

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.fd_interactivePopDisabled = YES;
    self.fd_prefersNavigationBarHidden = YES;

    self.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    self.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
}

@end
