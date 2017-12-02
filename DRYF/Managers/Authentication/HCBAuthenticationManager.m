//
//  HCBAuthenticationManager.m
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBAuthenticationManager.h"
#import "HCBDefaultsManager.h"
#import "HCBDriverModel.h"
#import "HCBPassengerModel.h"
#import "HCBAPIManager.h"

static NSString *const kAccessTokenKey = @"AccessTokenKey";
static NSString *const kCurrentUserKey = @"CurrentUserKey";

@implementation HCBAuthenticationManager

+(instancetype)sharedManager
{
    static HCBAuthenticationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        sharedManager = [HCBAuthenticationManager new];
    });
    return sharedManager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.accessToken = [HCBDefaultsManager getObjectForKey:kAccessTokenKey];
        
        if ([HCBDefaultsManager ifExists:kCurrentUserKey])
        {
            id currentUser = [NSKeyedUnarchiver unarchiveObjectWithData:[HCBDefaultsManager getObjectForKey:kCurrentUserKey]];
            
            if ([currentUser isKindOfClass:[HCBDriverModel class]])
            {
                self.currentDriver = currentUser;
                self.isDriverMode = YES;
            }
            else
            {
                self.currentPassenger = currentUser;
                self.isDriverMode = NO;
            }
        }
    }
    return self;
}

#pragma mark - Logic

-(void)authenticateWithPhone:(NSString *)phone
                successBlock:(HCBAuthenticationManagerSuccessBlock)successBlock
                failureBlock:(HCBAuthenticationManagerFailureBlock)failureBlock
{
    __weak typeof(self) weakSelf = self;
    
    [[HCBAPIManager sharedManager] postDataForPath:self.isDriverMode ? kAuthenticateDriverPath : kAuthenticatePassengerPath
                                        parameters:@{@"phone": phone}
                                      successBlock:^(NSDictionary *data)
     {
         weakSelf.phone = phone;
         
         successBlock();
     } failureBlock:^(NSError *error)
     {
         [weakSelf handleError:error block:failureBlock];
     }];
}

-(void)confirnPassengerCode:(NSString *)code
               successBlock:(HCBAuthenticationManagerSuccessBlock)successBlock
               failureBlock:(HCBAuthenticationManagerFailureBlock)failureBlock
{
    __weak typeof(self) weakSelf = self;
    
    [[HCBAPIManager sharedManager] postDataForPath:self.isDriverMode ? kConfirmDriverPath : kConfirmPassengerPath
                                        parameters:@{@"phone": _phone, @"code": code}
                                      successBlock:^(NSDictionary *data)
     {
         NSString *primaryKey = weakSelf.isDriverMode ? @"driver" : @"passenger";
         
         weakSelf.accessToken = data[primaryKey][@"access_token"];
         
         NSError *error = nil;
         if (weakSelf.isDriverMode)
         {
             HCBDriverModel *driver = [MTLJSONAdapter modelOfClass:[HCBDriverModel class]
                                                fromJSONDictionary:data[primaryKey]
                                                             error:&error];
             
             if (!error)
             {
                 weakSelf.currentDriver = driver;
                 
                 successBlock();
             }
             else
             {
                 [weakSelf handleError:error block:failureBlock];
             }
         }
         else
         {
             HCBPassengerModel *passenger = [MTLJSONAdapter modelOfClass:[HCBPassengerModel class]
                                                      fromJSONDictionary:data[primaryKey]
                                                                   error:&error];
             
             if (!error)
             {
                 weakSelf.currentPassenger = passenger;
                 
                 successBlock();
             }
             else
             {
                 [weakSelf handleError:error block:failureBlock];
             }
         }
     } failureBlock:^(NSError *error)
     {
         [weakSelf handleError:error block:failureBlock];
     }];
}

-(void)logout
{
    _accessToken = nil;
    _currentDriver = nil;
    
//    [[JAMAPNSManager sharedManager] unregister];
    [HCBDefaultsManager deleteAllKeys];
    
//    [[JAMSocketManager sharedManager] close];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kLogoutNotificationName
                                                        object:nil];
}

#pragma mark - Custom setters & getters

-(HCBUserModel *)currentUser
{
    return self.currentDriver ?: self.currentPassenger;
}

-(BOOL)isLoggedIn
{
    return (_accessToken != nil);
}

-(void)setAccessToken:(NSString *)accessToken
{
    _accessToken = accessToken;
    
    if (_accessToken && _accessToken.length > 0)
    {
        // Should be performed on next runloop tick
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [[JAMSocketManager sharedManager] connect];
//            [[JAMAPNSManager sharedManager] registerAPNSSettings];
//            [[JAMConversationModelManager sharedManager] getConversations:nil failureBlock:nil];
//        });
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:kLoginNotificationName object:nil];
        
        [HCBDefaultsManager setObject:_accessToken forKey:kAccessTokenKey];
    }
}

-(void)setCurrentDriver:(HCBDriverModel *)currentDriver
{
    _currentDriver = currentDriver;
    
    [HCBDefaultsManager setObject:[NSKeyedArchiver archivedDataWithRootObject:_currentDriver]
                           forKey:kCurrentUserKey];
}

-(void)setCurrentPassenger:(HCBPassengerModel *)currentPassenger
{
    _currentPassenger = currentPassenger;
    
    [HCBDefaultsManager setObject:[NSKeyedArchiver archivedDataWithRootObject:_currentPassenger]
                           forKey:kCurrentUserKey];
}

-(NSString *)phone
{
    return _phone ?: self.currentUser.phone;
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
