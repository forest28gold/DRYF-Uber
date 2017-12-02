//
//  HCBVerticalButton.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBVerticalButton.h"

@implementation HCBVerticalButton

-(void)layoutSubviews
{
    [super layoutSubviews];

    CGRect titleLabelFrame = self.titleLabel.frame;

    CGSize labelSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:@{NSFontAttributeName: self.titleLabel.font}
                                                     context:nil].size;

    labelSize = CGSizeMake(ceilf(labelSize.width), ceilf(labelSize.height));

    CGRect imageFrame = self.imageView.frame;

    CGSize fitBoxSize = (CGSize){.height = labelSize.height + _textTopPadding +  imageFrame.size.height, .width = MAX(imageFrame.size.width, labelSize.width)};

    CGRect fitBoxRect = CGRectInset(self.bounds, (self.bounds.size.width - fitBoxSize.width)/2, (self.bounds.size.height - fitBoxSize.height)/2);

    imageFrame.origin.y = fitBoxRect.origin.y;
    imageFrame.origin.x = CGRectGetMidX(fitBoxRect) - (imageFrame.size.width/2);
    self.imageView.frame = imageFrame;

    // Adjust the label size to fit the text, and move it below the image

    titleLabelFrame.size.width = labelSize.width;
    titleLabelFrame.size.height = labelSize.height;
    titleLabelFrame.origin.x = (self.frame.size.width / 2) - (labelSize.width / 2);
    titleLabelFrame.origin.y = fitBoxRect.origin.y + imageFrame.size.height + _textTopPadding;
    self.titleLabel.frame = titleLabelFrame;
}

@end
