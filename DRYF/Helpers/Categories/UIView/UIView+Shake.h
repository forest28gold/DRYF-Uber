//
//  UIView+Shake.h
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shake)

-(void)shake;
-(void)shake:(dispatch_block_t)completionBlock;

@end
