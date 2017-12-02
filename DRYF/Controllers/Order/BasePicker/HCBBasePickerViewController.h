//
//  HCBBasePickerViewController.h
//  DRYF
//
//  Created by AppsCreationTech on 09/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseViewController.h"

@interface HCBBasePickerViewController : HCBBaseViewController
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSIndexPath *selectedIndexPath;
@property(nonatomic, strong) NSIndexPath *toggleDatePickerIndexPath;

@property(nonatomic, copy) NSArray *data;

@end
