//
//  HCBUserModelManager.h
//  DRYF
//
//  Created by AppsCreationTech on 25/02/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HCBDriverModel, HCBPassengerModel;

typedef dispatch_block_t HCBUserModelManagerSuccessBlock;
//typedef void (^HCBUserModelManagerSuccessArrayBlock)(NSArray *users);
typedef void (^HCBUserModelManagerFailureBlock)(NSError *error);

@interface HCBUserModelManager : NSObject

+(instancetype)sharedManager;

-(void)updatePassengerInfo:(HCBPassengerModel *)passenger
              successBlock:(HCBUserModelManagerSuccessBlock)successBlock
              failureBlock:(HCBUserModelManagerFailureBlock)failureBlock;

-(void)updateDriverInfo:(HCBDriverModel *)driver
           successBlock:(HCBUserModelManagerSuccessBlock)successBlock
           failureBlock:(HCBUserModelManagerFailureBlock)failureBlock;

@end
