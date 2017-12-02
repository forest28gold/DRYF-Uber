//
//  UITableView+AutoDimension.h
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AutoDimension)

@property(nonatomic) IBInspectable BOOL autoDimension;
@property(nonatomic) IBInspectable CGFloat estimatedCellHeight;

-(void)registerCell:(NSString *)cellIdentifer;

@end
