//
//  HCBMenuHeaderView.m
//  DRYF
//
//  Created by AppsCreationTech on 08/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBMenuHeaderView.h"

@implementation HCBMenuHeaderView

-(IBAction)addButtonClicked:(id)sender
{
    if (_onClick)
    {
        _onClick();
    }
}

@end
