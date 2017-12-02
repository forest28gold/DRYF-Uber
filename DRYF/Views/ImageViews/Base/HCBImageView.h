//
//  HCBImageView.h
//  Stickinza
//
//  Created by AppsCreationTech on 24/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCBImageView : UIImageView

@property(nonatomic, strong) IBInspectable UIImage *placeholder;

-(void)setImageWithURL:(NSURL *)url;

@end
