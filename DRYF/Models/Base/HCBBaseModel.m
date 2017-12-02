//
//  HCBBaseModel.m
//  Stickinza
//
//  Created by AppsCreationTech on 21/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import "HCBBaseModel.h"

@implementation HCBBaseModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

-(NSDictionary *)dictionaryRepresentation
{
    return [MTLJSONAdapter JSONDictionaryFromModel:self error:nil];
}

@end
