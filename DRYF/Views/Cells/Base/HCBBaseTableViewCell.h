//
//  HCBBaseTableViewCell.h
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCBBaseTableViewCell : UITableViewCell

+(instancetype)loadWithTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath;

@end
