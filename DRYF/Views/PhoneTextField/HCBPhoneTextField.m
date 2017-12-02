//
//  HCBPhoneTextField.m
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBPhoneTextField.h"
#import "NSString+CommonValidation.h"

#import <NBAsYouTypeFormatter.h>
#import <NBPhoneNumber.h>
#import <NBPhoneNumberUtil.h>
#import <BlocksKit+UIKit.h>

static NSString *const kDefaultRegion = @"RU";

@interface HCBPhoneTextField ()
<
    UITextFieldDelegate
>

@property(nonatomic, strong) NBPhoneNumberUtil *phoneUtil;
@property(nonatomic, strong) NBPhoneNumber *phoneNumber;

@end

@implementation HCBPhoneTextField

#pragma mark - Required initializers

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

-(void)commonInit
{
    self.phoneUtil = [NBPhoneNumberUtil new];

    [self setBk_shouldChangeCharactersInRangeWithReplacementStringBlock:^BOOL(UITextField *textField, NSRange range, NSString *string)
    {
        if (!string.isNumeric)
        {
            return NO;
        }

        NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];

        NBAsYouTypeFormatter *phoneFormatter = [[NBAsYouTypeFormatter alloc] initWithRegionCode:kDefaultRegion];
        textField.text = [phoneFormatter inputString:text.onlyNumericString];

        return NO;
    }];
}

#pragma mark - Logic

-(BOOL)isValid
{
    NSError *error = nil;
    _phoneNumber = [_phoneUtil parse:self.phoneString
                       defaultRegion:kDefaultRegion
                               error:&error];

    return (!error && [_phoneUtil isValidNumber:_phoneNumber]);
}

#pragma mark - Custom getters

-(NSString *)phoneString
{
    return [NSString stringWithFormat:@"+7%@", self.text.onlyNumericString];
}

@end
