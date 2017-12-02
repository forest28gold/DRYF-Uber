//
//  HCBImageView.m
//  Stickinza
//
//  Created by AppsCreationTech on 24/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "HCBImageView.h"
#import "UIImageView+WebCache.h"

static NSTimeInterval const kFadeDuration = 0.2;

@implementation HCBImageView

-(void)setImageWithURL:(NSURL *)url
{
    __weak typeof(self) weakSelf = self;
    
    [self sd_setImageWithURL:url
            placeholderImage:self.placeholder
                     options:(SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageContinueInBackground)
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         if (image && cacheType == SDImageCacheTypeNone)
         {
             [UIView transitionWithView:weakSelf
                               duration:kFadeDuration
                                options:UIViewAnimationOptionTransitionCrossDissolve
                             animations:^
              {
                  weakSelf.image = image;
              } completion:nil];
         }
     }];
}

@end
