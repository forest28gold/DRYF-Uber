//
//  HCBBaseTableViewCell.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseTableViewCell.h"
#import "HCBUIConfig.h"

@implementation HCBBaseTableViewCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        UIView *selectedBacgroundView = [UIView new];
        selectedBacgroundView.backgroundColor = selectedCellColor();

        self.selectedBackgroundView = selectedBacgroundView;
    }
    return self;
}

+(instancetype)loadWithTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])
                                           forIndexPath:indexPath];
}

@end
