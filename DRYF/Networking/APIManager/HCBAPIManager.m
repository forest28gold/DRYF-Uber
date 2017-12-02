//
//  HCBAPIManager.h
//  DRYF
//
//  Created by AppsCreationTech on 21/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "HCBAPIManager.h"
#import "HCBAuthenticationManager.h"

static NSUInteger const kSuccessResponseCode = 200;

@implementation HCBAPIManager

+(instancetype)sharedManager
{
    static HCBAPIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *apiURLString = [NSString stringWithFormat:@"%@%@", kBaseURL, kApiPath];
        sharedManager = [[HCBAPIManager alloc] initWithBaseURL:[NSURL URLWithString:apiURLString]];
    });
    
    return sharedManager;
}


-(void)getDataForPath:(NSString *)path
           parameters:(NSDictionary *)parameters
         successBlock:(HCBAPIManagerSuccessBlock)successBlock
         failureBlock:(HCBAPIManagerFailureBlock)failureBlock
{
    [[self.class sharedManager] GET:path
                         parameters:[self parametersByAddingAccessToken:parameters]
                            success:^(NSURLSessionDataTask *task, id responseObject)
     {
         if ([self isSuccessStatusCode:task])
         {
             successBlock(responseObject);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
}

-(void)postDataForPath:(NSString *)path
            parameters:(NSDictionary *)parameters
          successBlock:(HCBAPIManagerSuccessBlock)successBlock
          failureBlock:(HCBAPIManagerFailureBlock)failureBlock
{
    [[self.class sharedManager] POST:path
                          parameters:[self parametersByAddingAccessToken:parameters]
                             success:^(NSURLSessionDataTask *task, id responseObject)
     {
         if ([self isSuccessStatusCode:task])
         {
             successBlock(responseObject);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
}

-(void)putDataForPath:(NSString *)path
           parameters:(NSDictionary *)parameters
         successBlock:(HCBAPIManagerSuccessBlock)successBlock
         failureBlock:(HCBAPIManagerFailureBlock)failureBlock
{
    [[self.class sharedManager] PUT:path
                         parameters:[self parametersByAddingAccessToken:parameters]
                            success:^(NSURLSessionDataTask *task, id responseObject)
     {
         if ([self isSuccessStatusCode:task])
         {
             successBlock(responseObject);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
}

-(void)deleteDataForPath:(NSString *)path
              parameters:(NSDictionary *)parameters
            successBlock:(HCBAPIManagerSuccessBlock)successBlock
            failureBlock:(HCBAPIManagerFailureBlock)failureBlock
{
    [[self.class sharedManager] DELETE:path
                          parameters:[self parametersByAddingAccessToken:parameters]
                             success:^(NSURLSessionDataTask *task, id responseObject)
     {
         if ([self isSuccessStatusCode:task])
         {
             successBlock(responseObject);
         }
     } failure:^(NSURLSessionDataTask *task, NSError *error) {
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
}

#pragma mark - Helpers

-(NSDictionary *)parametersByAddingAccessToken:(NSDictionary *)baseParameters
{
    NSMutableDictionary *mutableParameters = [baseParameters mutableCopy];
    
    if ([HCBAuthenticationManager sharedManager].accessToken.length > 0)
    {
        mutableParameters[@"access_token"] = [HCBAuthenticationManager sharedManager].accessToken;
    }
    
    return [mutableParameters copy];
}


-(BOOL)isSuccessStatusCode:(NSURLSessionDataTask *)task
{
    NSUInteger statusCode = ((NSHTTPURLResponse* )task.response).statusCode;
    
    return (statusCode == kSuccessResponseCode);
}

@end
