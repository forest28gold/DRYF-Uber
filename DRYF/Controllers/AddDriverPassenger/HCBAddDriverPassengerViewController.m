//
//  HCBAddDriverPassengerViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBAddDriverPassengerViewController.h"
#import "HCBPhoneTextField.h"

@interface HCBAddDriverPassengerViewController ()

@property (weak, nonatomic) IBOutlet HCBPhoneTextField *phoneTextField;

@end

@implementation HCBAddDriverPassengerViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [_phoneTextField becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.view endEditing:YES];
}

#pragma mark - Actions

-(IBAction)closeButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)doneButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
