//
//  HCBProfileBootstrapViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 07/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBProfileBootstrapViewController.h"
#import "UIView+Shake.h"
#import "HCBImagePicker.h"
#import "HCBAvatarImageView.h"
#import "HCBImageUploader.h"
#import "HCBUserModelManager.h"
#import "HCBAuthenticationManager.h"
#import "HCBDriverModel.h"
#import "HCBPassengerModel.h"

#import <UINavigationItem+Loading.h>

static NSString *const kToMainStoryboardSegueIdentifer = @"toMainStoryboard";

@interface HCBProfileBootstrapViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet HCBAvatarImageView *avatarImageView;

@property(nonatomic, copy) NSString *photoPath;

@end

@implementation HCBProfileBootstrapViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [_nameTextField becomeFirstResponder];
}

#pragma mark - Actions

-(IBAction)doneButtonClicked:(id)sender
{
    if (_nameTextField.text.length > 0)
    {
        [self.navigationItem startAnimatingAt:ANNavBarLoaderPositionRight];
        
        __weak typeof(self) weakSelf = self;
        if ([HCBAuthenticationManager sharedManager].isDriverMode)
        {
            HCBDriverModel *driver = [HCBAuthenticationManager sharedManager].currentDriver;
            driver.name = _nameTextField.text;
            driver.photo = _photoPath;
            [HCBAuthenticationManager sharedManager].currentDriver = driver;
            
            [[HCBUserModelManager sharedManager] updateDriverInfo:driver
                                                     successBlock:^
            {
                [weakSelf.navigationItem stopAnimating];
                [weakSelf performSegueWithIdentifier:kToMainStoryboardSegueIdentifer sender:self];
                
            } failureBlock:^(NSError *error)
            {
                [weakSelf.navigationItem stopAnimating];
            }];
        }
        else
        {
            HCBPassengerModel *passenger = [HCBAuthenticationManager sharedManager].currentPassenger;
            passenger.name = _nameTextField.text;
            passenger.photo = _photoPath;
            [HCBAuthenticationManager sharedManager].currentPassenger = passenger;
            
            [[HCBUserModelManager sharedManager] updatePassengerInfo:passenger
                                                        successBlock:^
             {
                 [weakSelf.navigationItem stopAnimating];
                 [weakSelf performSegueWithIdentifier:kToMainStoryboardSegueIdentifer sender:self];
                 
             } failureBlock:^(NSError *error)
             {
                 [weakSelf.navigationItem stopAnimating];
             }];
        }
    }
    else
    {
        [_nameTextField shake];
    }
}

-(IBAction)addPhotoButtonClicked:(id)sender
{
   [[HCBImagePicker imagePickerWithSender:self] start];
}

#pragma mark - Fucking image picker staff

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *originalImage = info[UIImagePickerControllerEditedImage];
    
    __weak typeof(self) weakSelf = self;
    [[HCBImageUploader sharedManager] uploadImage:originalImage
                                     successBlock:^(NSString *path)
    {
        weakSelf.photoPath = path;
        
    } progressBlock:^(double progress)
    {
        
    } failureBlock:^(NSError *error)
    {
        
    }];

    _avatarImageView.image = originalImage;
    _avatarImageView.hidden = NO;

    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)navigationController:(UINavigationController *)navigationController
     willShowViewController:(UIViewController *)viewController
                   animated:(BOOL)animated
{
    if ([viewController isKindOfClass:NSClassFromString(@"PLUIImageViewController")] ||
        [viewController isKindOfClass:NSClassFromString(@"PLUICameraViewController")])
    {
        [navigationController setNavigationBarHidden:YES];
    }
    else
    {
        [navigationController setNavigationBarHidden:NO];
    }
}

@end
