//
//  HCBImageUploader.m
//  DRYF
//
//  Created by AppsCreationTech on 25/02/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBImageUploader.h"
#import "HCBAPIConfig.h"

#import <AFNetworking.h>
#import <UIImage+ResizeMagick.h>
#import <SDImageCache.h>

@interface HCBImageUploader ()

@property(nonatomic, strong) AFHTTPRequestOperationManager *requestManager;

@end

@implementation HCBImageUploader

+(instancetype)sharedManager
{
    static HCBImageUploader *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [HCBImageUploader new];
    });
    
    return sharedManager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        NSURL *baseURL = [NSURL URLWithString:kBaseURL];
        _requestManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

-(void)uploadImage:(UIImage *)image
      successBlock:(HCBFileUploaderSuccessBlock)successBlock
     progressBlock:(HCBFileUploaderProgressBlock)progressBlock
      failureBlock:(HCBFileUploaderFailureBlock)failureBlock
{
    if (image.size.width > 1024)
    {
        image = [image resizedImageByWidth:1024];
    }
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    
    AFHTTPRequestOperation *operation = [_requestManager POST:kImageUploadPath
                                                   parameters:@{}
                                    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
    {
        [formData appendPartWithFileData:imageData
                                    name:@"image"
                                fileName:@"jpg"
                                mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        NSString *path = responseObject[@"message"];
                                             
        successBlock(path);
        
        [[SDImageCache sharedImageCache] storeImage:image forKey:path];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error)
    {
        failureBlock(error);
    }];
    
    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite)
     {
         double percentDone = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
         
         progressBlock(percentDone);
     }];
}

@end
