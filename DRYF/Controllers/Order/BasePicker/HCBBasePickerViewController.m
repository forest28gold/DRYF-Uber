//
//  HCBBasePickerViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 09/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBasePickerViewController.h"
#import "HCBDatePickerTableViewCell.h"
#import "HCBCheckmaekTableViewCell.h"
#import "UITableView+AutoDimension.h"

@interface HCBBasePickerViewController ()

@end

@implementation HCBBasePickerViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerCell:NSStringFromClass([HCBDatePickerTableViewCell class])];
    [self.tableView registerCell:NSStringFromClass([HCBCheckmaekTableViewCell class])];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 + ([self.selectedIndexPath isEqual:self.toggleDatePickerIndexPath]);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.data.count;
    }
    else
    {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        HCBDatePickerTableViewCell *cell = [HCBDatePickerTableViewCell loadWithTableView:tableView
                                                                               indexPath:indexPath];

        return cell;
    }
    else
    {
        HCBCheckmaekTableViewCell *cell = [HCBCheckmaekTableViewCell loadWithTableView:tableView
                                                                             indexPath:indexPath];

        cell.titleLabel.text = self.data[indexPath.row];
        cell.checkmark.hidden = !([indexPath isEqual:self.selectedIndexPath]);

        return cell;
    }
}

/*
 -(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return !tableView.isDragging;
 }
 */

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectedIndexPath isEqual:indexPath] || indexPath.section != 0)
    {
        return;
    }

    NSIndexPath *oldIndexPath = self.selectedIndexPath;

    HCBCheckmaekTableViewCell *oldSelctedCell = [tableView cellForRowAtIndexPath:self.selectedIndexPath];
    oldSelctedCell.checkmark.hidden = YES;

    HCBCheckmaekTableViewCell *newSelctedCell = [tableView cellForRowAtIndexPath:indexPath];
    newSelctedCell.checkmark.hidden = NO;

    self.selectedIndexPath = indexPath;

    if ([self.selectedIndexPath isEqual:self.toggleDatePickerIndexPath])
    {
        [tableView insertSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if ([oldIndexPath isEqual:self.toggleDatePickerIndexPath])
    {
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
