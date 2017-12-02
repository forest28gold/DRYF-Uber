//
//  UITextField+PlaceholderColor.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "UITextField+PlaceholderColor.h"

@implementation UITextField (PlaceholderColor)

@dynamic placeholderColor;

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    if (self.placeholder && self.placeholder.length > 0)
    {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder
                                                                     attributes:@{NSForegroundColorAttributeName: placeholderColor}];
    }
}

@end
