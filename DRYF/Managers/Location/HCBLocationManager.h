//
//  HCBLocationManager.h
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLLocation;

typedef void (^HCBLocationManagerReverseGeocodingBlock)(NSString *addressString);

@interface HCBLocationManager : NSObject

@property(nonatomic, strong) CLLocation *currentLocation;

+(instancetype)sharedManager;

-(void)startUpdatingLocation;
-(void)stopUpdatingLocation;

-(void)stringFromLocation:(CLLocation *)location
          completionBlock:(HCBLocationManagerReverseGeocodingBlock)completionBlock;

@end
