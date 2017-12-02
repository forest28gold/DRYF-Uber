//
//  HCBBaseModel.h
//  Stickinza
//
//  Created by AppsCreationTech on 21/08/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#import <Mantle.h>

@interface HCBBaseModel : MTLModel <MTLJSONSerializing>

-(NSDictionary *)dictionaryRepresentation;

@end
