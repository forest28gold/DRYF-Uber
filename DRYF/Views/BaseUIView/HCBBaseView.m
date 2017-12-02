//
//  HCBBaseView.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseView.h"

@implementation HCBBaseView

#pragma mark - Initializers

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self loadNib];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self loadNib];
    }
    return self;
}

-(void)loadNib
{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class])
                                                                 owner:self
                                                               options:nil] firstObject];
    NSAssert(view, @"Can't load view from nib.");
    view.frame = self.bounds;
    view.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);

    [self addSubview:view];
}

@end
