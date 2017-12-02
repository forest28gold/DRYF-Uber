//
//  HCBPassengerPickerViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 10/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBPassengerPickerViewController.h"
#import "HCBSelectPassengerCell.h"

@interface HCBPassengerPickerViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSIndexPath *selectedIndexPath;

@property(nonatomic, copy) NSArray *passengers;

@end

@implementation HCBPassengerPickerViewController


-(void)viewDidLoad
{
    [super viewDidLoad];

    _selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    _passengers = @[@"", @"", @"", @""];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _passengers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCBSelectPassengerCell *cell = [HCBSelectPassengerCell loadWithTableView:tableView
                                                                   indexPath:indexPath];

    cell.checkmark.hidden = !([indexPath isEqual:self.selectedIndexPath]);

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_selectedIndexPath isEqual:indexPath])
    {
        return;
    }

    HCBSelectPassengerCell *oldSelctedCell = [tableView cellForRowAtIndexPath:_selectedIndexPath];
    oldSelctedCell.checkmark.hidden = YES;

    HCBSelectPassengerCell *newSelctedCell = [tableView cellForRowAtIndexPath:indexPath];
    newSelctedCell.checkmark.hidden = NO;

    _selectedIndexPath = indexPath;
}


@end
