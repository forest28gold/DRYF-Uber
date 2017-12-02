//
//  HCBAPIConfig.h
//  DRYF
//
//  Created by AppsCreationTech on 12/07/15.
//  Copyright (c) 2015 AppsCreationTech. All rights reserved.
//

#ifdef DEV
    #define kBaseURL @"http://ruslab.rocks:3010/"
#else
    #define kBaseURL @"http://ruslab.rocks:3010/"
#endif

static NSString *const kApiPath = @"";

// Auth
static NSString *const kAuthenticateDriverPath = @"drivers";
static NSString *const kConfirmDriverPath = @"drivers/approve";
static NSString *const kAuthenticatePassengerPath = @"passengers";
static NSString *const kConfirmPassengerPath = @"passengers/approve";

// User
static NSString *const kUpdateDriverPath = @"drivers/%@";
static NSString *const kUpdatePassengerPath = @"passengers/%@";

// Upload
static NSString *const kImageUploadPath = @"upload_image";
