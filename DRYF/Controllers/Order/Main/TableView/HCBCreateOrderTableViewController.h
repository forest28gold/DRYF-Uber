//
//  HCBCreateOrderTableViewController.h
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HCBCreateOrderTableViewControllerDelegate <NSObject>

-(void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface HCBCreateOrderTableViewController : UITableViewController

@property(nonatomic, weak) id<HCBCreateOrderTableViewControllerDelegate> delegate;

@end
