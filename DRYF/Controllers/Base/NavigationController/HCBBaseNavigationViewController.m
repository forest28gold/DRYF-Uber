//
//  HCBBaseNavigationViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseNavigationViewController.h"

#import <UINavigationBar+Addition.h>

@interface HCBBaseNavigationViewController ()

@end

@implementation HCBBaseNavigationViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationBar hideBottomHairline];
    [self.navigationBar makeTransparent];
}

@end
