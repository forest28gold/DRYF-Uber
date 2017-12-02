//
//  HCBAccountModel.m
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBAccountModel.h"
#import "HCBPassengerModel.h"
#import "HCBDriverModel.h"

@implementation HCBAccountModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"passengers": @"passengers",
             @"drivers": @"drivers",
             };
}

#pragma mark - Custom transformers

+(NSValueTransformer *)passengersJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[HCBPassengerModel class]];
}

+(NSValueTransformer *)driversJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[HCBDriverModel class]];
}

@end
