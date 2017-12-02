//
//  HCBCommentViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 10/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBCommentViewController.h"

@interface HCBCommentViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation HCBCommentViewController

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [_textView becomeFirstResponder];
}

@end
