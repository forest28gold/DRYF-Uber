//
//  HCBUserModel.m
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBUserModel.h"

@implementation HCBUserModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"userID": @"_id",
             @"phone": @"phone",
             @"name": @"name",
             @"photo": @"photo"
             };
}

@end
