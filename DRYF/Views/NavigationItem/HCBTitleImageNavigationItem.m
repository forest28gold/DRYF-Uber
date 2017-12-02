//
//  HCBTitleImageNavigationItem.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBTitleImageNavigationItem.h"

@implementation HCBTitleImageNavigationItem

-(void)setTitleImage:(UIImage *)titleImage
{
    _titleImage = titleImage;

    self.titleView = [[UIImageView alloc] initWithImage:titleImage];
}

@end
