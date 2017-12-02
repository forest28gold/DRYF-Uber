//
//  HCBOrderModel.m
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBOrderModel.h"
#import "HCBDriverModel.h"
#import "HCBPassengerModel.h"

@import CoreLocation;

@implementation HCBOrderModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"orderID": @"_id",
             @"pickupLocation": @"pickupLocation",
             @"destinationLocation": @"destinationLocation",
             @"passenger": @"passenger",
             @"driver": @"driver",
             @"time": @"time",
             @"duration": @"duration",
             @"repeat": @"repeat",
             @"comment": @"comment"
             };
}

#pragma mark - Custom transformers

+(NSValueTransformer *)pickupLocationJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *coordinates, BOOL *success, NSError *__autoreleasing *error)
            {
                return [[CLLocation alloc] initWithLatitude:[coordinates.lastObject doubleValue]
                                                  longitude:[coordinates.firstObject doubleValue]];
                
            } reverseBlock:^id(CLLocation *location, BOOL *success, NSError *__autoreleasing *error)
            {
                return @[@(location.coordinate.longitude), @(location.coordinate.latitude)];
            }];
}

+(NSValueTransformer *)destinationLocationJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSArray *coordinates, BOOL *success, NSError *__autoreleasing *error)
            {
                return [[CLLocation alloc] initWithLatitude:[coordinates.lastObject doubleValue]
                                                  longitude:[coordinates.firstObject doubleValue]];
                
            } reverseBlock:^id(CLLocation *location, BOOL *success, NSError *__autoreleasing *error)
            {
                return @[@(location.coordinate.longitude), @(location.coordinate.latitude)];
            }];
}

+(NSValueTransformer *)timeJSONTransformer
{
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *dateDigits, BOOL *success, NSError *__autoreleasing *error)
            {
                return [NSDate dateWithTimeIntervalSince1970:dateDigits.doubleValue];
            } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error)
            {
                return @([date timeIntervalSince1970]);
            }];
}

+(NSValueTransformer *)passengerJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[HCBPassengerModel class]];
}

+(NSValueTransformer *)driverJSONTransformer
{
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[HCBDriverModel class]];
}

@end
