//
//  HCBSheduleTableViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBSheduleTableViewController.h"
#import "HCBSheduleCell.h"
#import "HCBSheduleHeaderView.h"

@interface HCBSheduleTableViewController ()

@end

@implementation HCBSheduleTableViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    UIView *transparentHeader = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, self.view.frame.size.height / 2)];
    transparentHeader.backgroundColor = [UIColor clearColor];

//    self.tableView.contentInset = UIEdgeInsetsMake(self.view.frame.size.height / 2,
//                                                   0.0,
//                                                   0.0,
//                                                   0.0);

    self.tableView.tableHeaderView = transparentHeader;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HCBSheduleCell *cell = [HCBSheduleCell loadWithTableView:tableView indexPath:indexPath];

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HCBSheduleHeaderView *header = [[HCBSheduleHeaderView alloc] initWithFrame:CGRectMake(0.0,
                                                                                         0.0,
                                                                                         tableView.frame.size.width,
                                                                                         30.0)];
    header.titleLabel.text = @"Tomorrow";
    return header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

@end
