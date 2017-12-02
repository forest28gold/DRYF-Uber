//
//  HCBAPIManager.h
//  DRYF
//
//  Created by AppsCreationTech on 21/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "HCBAPIConfig.h"

typedef void (^HCBAPIManagerSuccessBlock)(NSDictionary *data);
typedef void (^HCBAPIManagerFailureBlock)(NSError *error);

@interface HCBAPIManager : AFHTTPSessionManager

+(instancetype)sharedManager;

-(void)getDataForPath:(NSString *)path
           parameters:(NSDictionary *)parameters
         successBlock:(HCBAPIManagerSuccessBlock)successBlock
         failureBlock:(HCBAPIManagerFailureBlock)failureBlock;

-(void)postDataForPath:(NSString *)path
            parameters:(NSDictionary *)parameters
          successBlock:(HCBAPIManagerSuccessBlock)successBlock
          failureBlock:(HCBAPIManagerFailureBlock)failureBlock;

-(void)putDataForPath:(NSString *)path
           parameters:(NSDictionary *)parameters
         successBlock:(HCBAPIManagerSuccessBlock)successBlock
         failureBlock:(HCBAPIManagerFailureBlock)failureBlock;

-(void)deleteDataForPath:(NSString *)path
              parameters:(NSDictionary *)parameters
            successBlock:(HCBAPIManagerSuccessBlock)successBlock
            failureBlock:(HCBAPIManagerFailureBlock)failureBlock;

@end
