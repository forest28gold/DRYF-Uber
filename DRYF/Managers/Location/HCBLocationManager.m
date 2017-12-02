//
//  HCBLocationManager.m
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBLocationManager.h"

@import CoreLocation;
@import AddressBook;

static CLLocationDistance const kDistanceFilter = 5.0;

@interface HCBLocationManager ()
<
    CLLocationManagerDelegate
>

@property(nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation HCBLocationManager

+(instancetype)sharedManager
{
    static HCBLocationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [HCBLocationManager new];
    });

    return sharedManager;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        _locationManager = [CLLocationManager new];
        [_locationManager requestAlwaysAuthorization];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kDistanceFilter;
    }
    return self;
}

#pragma mark - Locatoin manager delegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _currentLocation = locations.lastObject;

    [self stringFromLocation:_currentLocation completionBlock:^(NSString *addressString) {

    }];
}

#pragma mark - Logic 

-(void)startUpdatingLocation
{
    [_locationManager startUpdatingLocation];
}

-(void)stopUpdatingLocation
{
    [_locationManager stopUpdatingHeading];
}

-(void)stringFromLocation:(CLLocation *)location
          completionBlock:(HCBLocationManagerReverseGeocodingBlock)completionBlock
{
    CLGeocoder *geocoder = [CLGeocoder new];

    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if (placemarks.count > 0 && !error)
        {
            NSString *addressString = [placemarks.firstObject.addressDictionary objectForKey:(NSString*)kABPersonAddressStreetKey];

            completionBlock(addressString);
        }
    }];
}

@end
