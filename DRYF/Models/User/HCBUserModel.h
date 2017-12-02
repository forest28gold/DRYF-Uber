//
//  HCBUserModel.h
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBBaseModel.h"

@interface HCBUserModel : HCBBaseModel

@property(nonatomic, copy) NSString *userID;
@property(nonatomic, copy) NSString *phone;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *photo;

@end
