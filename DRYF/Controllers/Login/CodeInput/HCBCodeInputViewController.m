//
//  HCBCodeInputViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBCodeInputViewController.h"
#import "HCBUIConfig.h"
#import "HCBProfileBootstrapViewController.h"
#import "HCBAuthenticationManager.h"
#import "UIView+Shake.h"
#import "HCBUserModel.h"

#import "OCMaskedTextFieldView.h"
#import <BlocksKit.h>
#import <UINavigationItem+Loading.h>
#import <NBPhoneNumberUtil.h>
#import <NBPhoneNumber.h>

static NSUInteger const kCodeLenght = 4;
static NSString *const kDefaultRegion = @"RU";

@interface HCBCodeInputViewController ()

@property (weak, nonatomic) IBOutlet OCMaskedTextFieldView *codeTextField;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end

@implementation HCBCodeInputViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NBPhoneNumberUtil *phoneUtil = [NBPhoneNumberUtil new];
    NBPhoneNumber *phoneNumber = [phoneUtil parse:[HCBAuthenticationManager sharedManager].phone
                                     defaultRegion:kDefaultRegion
                                             error:nil];
    
    NSString *formattedPhone = [phoneUtil format:phoneNumber
                                     numberFormat:NBEPhoneNumberFormatINTERNATIONAL
                                            error:nil];
    _phoneLabel.text = formattedPhone;

    [_codeTextField setMask:@"#    #    #    #"];
    [_codeTextField showMask];
    setFieldStyle([_codeTextField maskedTextField]);
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self startObserving];
}

-(void)startObserving
{
    [[_codeTextField maskedTextField] becomeFirstResponder];
    
    __weak typeof(self) weakSelf = self;
    __block NSString *observerToken = [[_codeTextField maskedTextField] bk_addObserverForKeyPath:@"text"
                                                                                            task:^(id target)
    {
        [weakSelf validateCode:[weakSelf.codeTextField getRawInputText] observerToken:observerToken];
    }];
}

-(void)validateCode:(NSString *)code observerToken:(NSString *)observerToken
{
    if (code.length == kCodeLenght)
    {
        if (observerToken)
        {
            [[_codeTextField maskedTextField] bk_removeObserversWithIdentifier:observerToken];
        }
        [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionRight];
        
        __weak typeof(self) weakSelf = self;
        [[HCBAuthenticationManager sharedManager] confirnPassengerCode:code
                                                          successBlock:^
         {
             [weakSelf.navigationItem stopAnimating];
             [weakSelf performSegueWithIdentifier:NSStringFromClass([HCBProfileBootstrapViewController class]) sender:self];
             
         } failureBlock:^(NSError *error)
         {
             [weakSelf.navigationItem stopAnimating];
             [weakSelf.codeTextField shake:^
              {
                  [weakSelf.codeTextField showMask];
                  [weakSelf startObserving];
              }];
             
         }];
    }
}

#pragma mark - Actions

-(IBAction)doneButtonClicked:(id)sender
{
    if ([_codeTextField getRawInputText].length == kCodeLenght)
    {
        [self validateCode:[_codeTextField getRawInputText] observerToken:nil];
    }
    else
    {
        [_codeTextField shake];
    }
}

#pragma mark - Helpers

NS_INLINE void setFieldStyle(UITextField *textField)
{
    [textField setTextAlignment:NSTextAlignmentCenter];
    [textField setKeyboardAppearance:UIKeyboardAppearanceDark];
    [textField setBorderStyle:UITextBorderStyleNone];
    [textField setFont:[UIFont systemFontOfSize:36 weight:UIFontWeightUltraLight]];
    [textField setTextColor:blueColor()];
    [textField setTintColor:[UIColor clearColor]];
}

@end
