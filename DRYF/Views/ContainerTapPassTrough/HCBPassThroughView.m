//
//  HCBPassThroughView.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBPassThroughView.h"

@implementation HCBPassThroughView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];

    // It means touch was at tableview backgrpund view with no content or clear color view
    if ([hitView isKindOfClass:[UITableView class]] || [hitView.backgroundColor isEqual:[UIColor clearColor]])
    {
        return nil;
    }

    return hitView;
}

@end
