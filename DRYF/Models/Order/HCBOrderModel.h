//
//  HCBOrderModel.h
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBBaseModel.h"

@class HCBPassengerModel, HCBDriverModel, CLLocation;

@interface HCBOrderModel : HCBBaseModel

@property(nonatomic, copy) NSString *orderID;
@property(nonatomic, strong) CLLocation *pickupLocation;
@property(nonatomic, strong) CLLocation *destinationLocation;
@property(nonatomic, strong) HCBPassengerModel *passenger;
@property(nonatomic, strong) HCBDriverModel *driver;
@property(nonatomic, strong) NSDate *time;
@property(nonatomic, strong) NSNumber *duration;
@property(nonatomic, copy) NSArray *repeat;
@property(nonatomic, copy) NSString *comment;

@end
