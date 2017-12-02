//
//  HCBCreateOrderViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBCreateOrderViewController.h"
#import "HCBCreateOrderTableViewController.h"
#import "HCBSelectAddressMapViewController.h"
#import "HCBTimePickerViewController.h"
#import "HCBDurationPickerViewController.h"
#import "HCBRepeatPockerViewController.h"
#import "HCBCommentViewController.h"
#import "HCBPassengerPickerViewController.h"

@interface HCBCreateOrderViewController ()
<
    HCBCreateOrderTableViewControllerDelegate
>

@end

@implementation HCBCreateOrderViewController

#pragma mark - HCBCreateOrderTableViewControllerDelegate

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBSelectAddressMapViewController class]) sender:self];
        }
            break;
        case 1:
        {

        }
            break;
        case 2:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBTimePickerViewController class]) sender:self];
        }
            break;
        case 3:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBDurationPickerViewController class]) sender:self];
        }
            break;
        case 4:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBRepeatPockerViewController class]) sender:self];
        }
            break;
        case 5:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBCommentViewController class]) sender:self];
        }
            break;
        case 6:
        {
            [self performSegueWithIdentifier:NSStringFromClass([HCBPassengerPickerViewController class]) sender:self];
        }
            break;
    }
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:NSStringFromClass([HCBCreateOrderTableViewController class])])
    {
        HCBCreateOrderTableViewController *createOrderTableView = segue.destinationViewController;

        createOrderTableView.delegate = self;
    }
    else if ([segue.identifier isEqualToString:NSStringFromClass([HCBTimePickerViewController class])])
    {
        HCBTimePickerViewController *timePicker = segue.destinationViewController;

        timePicker.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        timePicker.toggleDatePickerIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        
        timePicker.data = @[
                            NSLocalizedString(@"As soon as possible", nil),
                            NSLocalizedString(@"Reservation for…", nil)
                            ];
    }
    else if ([segue.identifier isEqualToString:NSStringFromClass([HCBDurationPickerViewController class])])
    {
        HCBDurationPickerViewController *durationPicker = segue.destinationViewController;

        durationPicker.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        durationPicker.toggleDatePickerIndexPath = [NSIndexPath indexPathForRow:4 inSection:0];

        durationPicker.data = @[
                                NSLocalizedString(@"30 min", nil),
                                NSLocalizedString(@"1 hour", nil),
                                NSLocalizedString(@"1 hour 30 minutes", nil),
                                NSLocalizedString(@"2 hours", nil),
                                NSLocalizedString(@"Other...", nil)
                                ];
    }
    else if ([segue.identifier isEqualToString:NSStringFromClass([HCBRepeatPockerViewController class])])
    {
        HCBDurationPickerViewController *durationPicker = segue.destinationViewController;

        durationPicker.data = @[
                                NSLocalizedString(@"Every Monday", nil),
                                NSLocalizedString(@"Every Tuesday", nil),
                                NSLocalizedString(@"Every Wednesday", nil),
                                NSLocalizedString(@"Every Thursday", nil),
                                NSLocalizedString(@"Every Friday", nil),
                                NSLocalizedString(@"Every Saturday", nil),
                                NSLocalizedString(@"Every Sunday", nil)
                                ];
    }
}

#pragma mark - Actions

-(IBAction)cancelButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
