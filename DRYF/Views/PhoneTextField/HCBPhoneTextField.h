//
//  HCBPhoneTextField.h
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCBPhoneTextField : UITextField

@property(nonatomic, copy) NSString *phoneString;

-(BOOL)isValid;

@end
