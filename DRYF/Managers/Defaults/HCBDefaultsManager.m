//
//  HCBDefaultsManager.m
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import "HCBDefaultsManager.h"

@implementation HCBDefaultsManager

+(void)setObject:(id)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(id)getObjectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(BOOL)ifExists:(NSString *)key
{
    return ([[NSUserDefaults standardUserDefaults] objectForKey:key] != nil);
}

+(void)deleteAllKeys
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

@end
