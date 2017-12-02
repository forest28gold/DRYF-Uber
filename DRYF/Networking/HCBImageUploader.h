//
//  HCBImageUploader.h
//  DRYF
//
//  Created by AppsCreationTech on 25/02/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

@import UIKit;

typedef void (^HCBFileUploaderSuccessBlock)(NSString *path);
typedef void (^HCBFileUploaderProgressBlock)(double progress);
typedef void (^HCBFileUploaderFailureBlock)(NSError *error);

@interface HCBImageUploader : NSObject

+(instancetype)sharedManager;

-(void)uploadImage:(UIImage *)image
      successBlock:(HCBFileUploaderSuccessBlock)successBlock
     progressBlock:(HCBFileUploaderProgressBlock)progressBlock
      failureBlock:(HCBFileUploaderFailureBlock)failureBlock;

@end
