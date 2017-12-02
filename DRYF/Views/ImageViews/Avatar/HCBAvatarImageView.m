//
//  HCBAvatarImageView.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBAvatarImageView.h"
#import "HCBUIConfig.h"

@implementation HCBAvatarImageView

-(void)willMoveToWindow:(UIWindow *)newWindow
{
    [super willMoveToWindow:newWindow];

    if (!self.image)
    {
        self.image = self.placeholder;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];

    if (!self.layer.masksToBounds)
    {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = blueColor().CGColor;
    }
}

-(UIImage *)placeholder
{
    return [UIImage imageNamed:@"AvatarPlaceholder"];
}

@end
