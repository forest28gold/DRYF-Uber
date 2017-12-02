//
//  UITableView+AutoDimension.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "UITableView+AutoDimension.h"

@implementation UITableView (AutoDimension)

@dynamic autoDimension;
@dynamic estimatedCellHeight;

-(void)setAutoDimension:(BOOL)autoDimension
{
    self.rowHeight = UITableViewAutomaticDimension;
}

-(void)setEstimatedCellHeight:(CGFloat)estimatedCellHeight
{
    self.estimatedRowHeight = estimatedCellHeight;
}

-(void)registerCell:(NSString *)cellIdentifer
{
    [self registerNib:[UINib nibWithNibName:cellIdentifer bundle:nil] forCellReuseIdentifier:cellIdentifer];
}

@end
