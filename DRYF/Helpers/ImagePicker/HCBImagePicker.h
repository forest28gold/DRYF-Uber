//
//  HCBImagePicker.h
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

typedef void (^HCBImagePickerCompletionBlock)(UIImage *image);

@interface HCBImagePicker : NSObject

+(instancetype)imagePickerWithSender:(id)sender
                     completionBlock:(HCBImagePickerCompletionBlock)completionBlock;

+(instancetype)imagePickerWithSender:(id)sender;

-(void)start;

@end
