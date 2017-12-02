//
//  HCBMenuViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBMenuViewController.h"
#import "HCBMenuHeaderView.h"
#import "HCBMenuAddTableViewCell.h"
#import "HCBMenuUserTableViewCell.h"
#import "HCBAddDriverPassengerViewController.h"
#import "HCBProfileViewController.h"

@interface HCBMenuViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@end

@implementation HCBMenuViewController

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCBMenuUserTableViewCell *cell = [HCBMenuUserTableViewCell loadWithTableView:tableView indexPath:indexPath];

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HCBMenuHeaderView *header = [[HCBMenuHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, tableView.frame.size.width, 100.0)];
    header.titleLabel.text = @"Passenger";

    header.onClick = ^
    {
        NSLog(@"");
    };

    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:NSStringFromClass([HCBAddDriverPassengerViewController class]) sender:self];
}

#pragma mark - Actions

-(IBAction)headerClicked:(id)sender
{
    [self performSegueWithIdentifier:NSStringFromClass([HCBProfileViewController class]) sender:self];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

}

@end
