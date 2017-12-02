//
//  HCBDatePickerTableViewCell.m
//  DRYF
//
//  Created by AppsCreationTech on 09/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBDatePickerTableViewCell.h"

@implementation HCBDatePickerTableViewCell


// Fucking shit about date picker in iOS 9 :)
-(void)layoutSubviews
{
    [self hackDatePicker];

    [super layoutSubviews];

    [self hackDatePicker];
}

-(void)hackDatePicker
{
    // Fucking fix about date picker white view in the middle
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _datePicker.datePickerMode = UIDatePickerModeDateAndTime;

    [_datePicker setValue:[UIColor whiteColor] forKeyPath:@"textColor"];
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:_datePicker];
}


@end
