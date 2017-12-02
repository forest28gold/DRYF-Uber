//
//  UIView+Shake.m
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "UIView+Shake.h"

#import <AFViewShaker.h>

static NSTimeInterval const kShakeDuration = 0.5;

@implementation UIView (Shake)

-(void)shake
{
    AFViewShaker *shaker = [[AFViewShaker alloc] initWithView:self];

    [shaker shake];
}

-(void)shake:(dispatch_block_t)completionBlock
{
    AFViewShaker *shaker = [[AFViewShaker alloc] initWithView:self];
    
    [shaker shakeWithDuration:kShakeDuration completion:^
    {
        completionBlock();
    }];
}

@end
