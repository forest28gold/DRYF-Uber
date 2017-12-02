//
//  MMDrawerController+Storyboard.m
//  My Credit
//
//  Created by AppsCreationTech on 04/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "MMDrawerController+Storyboard.h"

@interface MMDrawerControllerSegue : UIStoryboardSegue

@end

@implementation MMDrawerControllerSegue

-(void)perform
{
    NSAssert([self.sourceViewController isKindOfClass: [MMDrawerController class]], @"MMDrawerControllerSegue only to be used to define left/center/right controllers for a MMDrawerController!");
}

@end

@implementation MMDrawerController (Storyboard)

-(void)awakeFromNib
{
    if (self.storyboard != nil)
    {
        [self performSegueWithIdentifier:@"mm_center" sender: self];
        @try
        {
            [self performSegueWithIdentifier:@"mm_left" sender: self];
        }
        @catch (NSException *exception)
        {
        }
        @try
        {
            [self performSegueWithIdentifier:@"mm_right" sender: self];
        }
        @catch (NSException *exception)
        {
//            NSLog(@"Drawer controller exception: %@", exception.reason);
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mm_center"])
    {
        NSParameterAssert( [segue isKindOfClass:[MMDrawerControllerSegue class]]);
        [self setCenterViewController: segue.destinationViewController];
    }
    else if ([segue.identifier isEqualToString: @"mm_left"])
    {
        NSParameterAssert( [segue isKindOfClass:[MMDrawerControllerSegue class]]);
        [self setLeftDrawerViewController: segue.destinationViewController];
    }
    else if ([segue.identifier isEqualToString: @"mm_right"])
    {
        NSParameterAssert( [segue isKindOfClass:[MMDrawerControllerSegue class]]);
        [self setRightDrawerViewController: segue.destinationViewController];
    }
}

@end
