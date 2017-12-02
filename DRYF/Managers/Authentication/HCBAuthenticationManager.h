//
//  HCBAuthenticationManager.h
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HCBDriverModel, HCBPassengerModel, HCBUserModel;

static NSString *const kLogoutNotificationName = @"LogoutNotification";

typedef dispatch_block_t HCBAuthenticationManagerSuccessBlock;
typedef void (^HCBAuthenticationManagerFailureBlock)(NSError *error);

@interface HCBAuthenticationManager : NSObject

@property(nonatomic, copy) NSString *phone;
@property(nonatomic, strong) NSString *accessToken;
@property(nonatomic) BOOL isLoggedIn;
@property(nonatomic) BOOL isDriverMode;
@property(nonatomic, strong) HCBPassengerModel *currentPassenger;
@property(nonatomic, strong) HCBDriverModel *currentDriver;
@property(nonatomic, strong) HCBUserModel *currentUser;

+(instancetype)sharedManager;

-(void)authenticateWithPhone:(NSString *)phone
                successBlock:(HCBAuthenticationManagerSuccessBlock)successBlock
                failureBlock:(HCBAuthenticationManagerFailureBlock)failureBlock;

-(void)confirnPassengerCode:(NSString *)code
               successBlock:(HCBAuthenticationManagerSuccessBlock)successBlock
               failureBlock:(HCBAuthenticationManagerFailureBlock)failureBlock;

-(void)logout;

@end
