//
//  HCBUserModelManager.m
//  DRYF
//
//  Created by AppsCreationTech on 25/02/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBUserModelManager.h"
#import "HCBPassengerModel.h"
#import "HCBDriverModel.h"
#import "HCBAPIManager.h"
#import "HCBAuthenticationManager.h"

@implementation HCBUserModelManager

+(instancetype)sharedManager
{
    static HCBUserModelManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        sharedManager = [HCBUserModelManager new];
    });
    return sharedManager;
}

-(void)updatePassengerInfo:(HCBPassengerModel *)passenger
              successBlock:(HCBUserModelManagerSuccessBlock)successBlock
              failureBlock:(HCBUserModelManagerFailureBlock)failureBlock
{
    NSString *path = [NSString stringWithFormat:kUpdatePassengerPath, passenger.userID];
    
    __weak typeof(self) weakSelf = self;
    [[HCBAPIManager sharedManager] putDataForPath:path
                                       parameters:passenger.dictionaryRepresentation
                                     successBlock:^(NSDictionary *data)
    {
        NSError *error = nil;
        HCBPassengerModel *passenger = [MTLJSONAdapter modelOfClass:[HCBPassengerModel class]
                                                 fromJSONDictionary:data[@"passenger"]
                                                              error:&error];
        
        if (!error)
        {
            [HCBAuthenticationManager sharedManager].currentPassenger = passenger;
            
            successBlock();
        }
        else
        {
            [weakSelf handleError:error block:failureBlock];
        }
        
    } failureBlock:^(NSError *error)
    {
        [weakSelf handleError:error block:failureBlock];
    }];
}

-(void)updateDriverInfo:(HCBDriverModel *)driver
           successBlock:(HCBUserModelManagerSuccessBlock)successBlock
           failureBlock:(HCBUserModelManagerFailureBlock)failureBlock
{
    NSString *path = [NSString stringWithFormat:kUpdateDriverPath, driver.userID];
    
    __weak typeof(self) weakSelf = self;
    [[HCBAPIManager sharedManager] putDataForPath:path
                                       parameters:driver.dictionaryRepresentation
                                     successBlock:^(NSDictionary *data)
     {
         NSError *error = nil;
         HCBDriverModel *driver = [MTLJSONAdapter modelOfClass:[HCBDriverModel class]
                                            fromJSONDictionary:data[@"driver"]
                                                         error:&error];
         
         if (!error)
         {
             [HCBAuthenticationManager sharedManager].currentDriver = driver;
             
             successBlock();
         }
         else
         {
             [weakSelf handleError:error block:failureBlock];
         }
     } failureBlock:^(NSError *error)
     {
         [weakSelf handleError:error block:failureBlock];
     }];
}

#pragma mark - Helpers

-(void)handleError:(NSError *)error block:(HCBAPIManagerFailureBlock)failureBlock
{
    NSLog(@"%@", error.userInfo);
    if (failureBlock)
    {
        failureBlock(error);
    }
}

@end
