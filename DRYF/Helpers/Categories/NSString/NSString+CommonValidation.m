//
//  NSString+CommonValidation.m
//  DRYF
//
//  Created by AppsCreationTech on 11/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "NSString+CommonValidation.h"

static NSString *const onlyNumericRegex = @"[^\\d]";
static NSString *const emptyString = @"";

@implementation NSString (CommonValidation)

-(BOOL)isNumeric
{
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *selfSet = [NSCharacterSet characterSetWithCharactersInString:self];

    return [alphaNumbersSet isSupersetOfSet:selfSet];
}

-(NSString *)onlyNumericString
{
    return [self stringByReplacingOccurrencesOfString:onlyNumericRegex
                                           withString:emptyString
                                              options:NSRegularExpressionSearch
                                                range:NSMakeRange(0, self.length)];
}

@end
