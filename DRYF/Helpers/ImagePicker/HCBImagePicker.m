//
//  HCBImagePicker.m
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBImagePicker.h"

#import <BlocksKit+UIKit.h>

@import UIKit;

@interface HCBImagePicker ()
<
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate
>

@property(nonatomic, weak) id sender;
@property(nonatomic, copy) HCBImagePickerCompletionBlock completionBlock;

@property(nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation HCBImagePicker

+(instancetype)imagePickerWithSender:(id)sender
                     completionBlock:(HCBImagePickerCompletionBlock)completionBlock
{
    return [[HCBImagePicker alloc] initWithSender:sender
                                  completionBlock:completionBlock];
}

+(instancetype)imagePickerWithSender:(id)sender
{
    return [[HCBImagePicker alloc] initWithSender:sender
                                  completionBlock:nil];
}

-(instancetype)initWithSender:(id)sender
              completionBlock:(HCBImagePickerCompletionBlock)completionBlock
{
    self = [super init];
    if (self)
    {
        self.sender = sender;
    }
    return self;
}

-(void)start
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];

    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Choose Photo", nil)
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action)
                                {
                                    [self presentImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
                                }]];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Take Photo", nil)
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action)
                                    {
                                        [self presentImagePicker:UIImagePickerControllerSourceTypeCamera];
                                    }]];
    }
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil)
                                                        style:UIAlertActionStyleCancel
                                                      handler:nil]];

    [_sender presentViewController:alertController animated:YES completion:nil];
}

-(void)presentImagePicker:(UIImagePickerControllerSourceType)sourceType
{
    _imagePicker = [UIImagePickerController new];
    _imagePicker.delegate = _sender;
    _imagePicker.sourceType = sourceType;
    _imagePicker.allowsEditing = YES;
    [_sender presentViewController:_imagePicker animated:YES completion:nil];
}

@end
