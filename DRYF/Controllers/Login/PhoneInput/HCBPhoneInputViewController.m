//
//  HCBPhoneInputViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBPhoneInputViewController.h"
#import "HCBCodeInputViewController.h"
#import "HCBPhoneTextField.h"
#import "UIView+Shake.h"
#import "HCBAuthenticationManager.h"

#import <UINavigationItem+Loading.h>

@interface HCBPhoneInputViewController ()

@property (weak, nonatomic) IBOutlet HCBPhoneTextField *phoneTextField;

@end

@implementation HCBPhoneInputViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [_phoneTextField becomeFirstResponder];
}

#pragma mark - Actions

-(IBAction)doneButtonClicked:(id)sender
{
    if ([_phoneTextField isValid])
    {
        [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionRight];
        
        __weak typeof(self) weakSelf = self;
        [[HCBAuthenticationManager sharedManager] authenticateWithPhone:_phoneTextField.phoneString
                                                           successBlock:^
        {
            [weakSelf.navigationItem stopAnimating];
            [weakSelf performSegueWithIdentifier:NSStringFromClass([HCBCodeInputViewController class]) sender:self];
            
        } failureBlock:^(NSError *error)
        {
            [weakSelf.navigationItem stopAnimating];
            [weakSelf.phoneTextField shake];
        }];
    }
    else
    {
        [_phoneTextField shake];
    }
}

@end
