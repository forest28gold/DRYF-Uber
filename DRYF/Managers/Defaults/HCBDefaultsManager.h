//
//  HCBDefaultsManager.h
//  DRYF
//
//  Created by AppsCreationTech on 20/01/16.
//  Copyright © 2016 AppsCreationTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HCBDefaultsManager : NSObject

+(void)setObject:(id)object forKey:(NSString *)key;

+(id)getObjectForKey:(NSString *)key;

+(BOOL)ifExists:(NSString *)key;

+(void)deleteAllKeys;

@end
