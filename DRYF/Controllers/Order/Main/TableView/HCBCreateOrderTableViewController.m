//
//  HCBCreateOrderTableViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBCreateOrderTableViewController.h"

@interface HCBCreateOrderTableViewController ()

@end

@implementation HCBCreateOrderTableViewController

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_delegate didSelectRowAtIndexPath:indexPath];
}

@end
