//
//  HCBUIConfig.h
//  My Credit
//
//  Created by Ivan Kozlov on 04/08/15.
//  Copyright (c) 2015 Ivan Kozlov. All rights reserved.
//

#define RGB(r, g, b) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:a]

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)

NS_INLINE UIColor* colorFromHexString(NSString *hexString)
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if (hexString.length > 0 && [hexString characterAtIndex:0] == '#')
    {
        [scanner setScanLocation:1];
    }
    [scanner scanHexInt:&rgbValue];
    
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0
                           green:((rgbValue & 0xFF00) >> 8)/255.0
                            blue:(rgbValue & 0xFF)/255.0
                           alpha:1.0];
}

NS_INLINE UIColor* baseGrayColor()
{
    return colorFromHexString(@"323234");
}

NS_INLINE UIColor* placeholderColor()
{
    return colorFromHexString(@"5D5D5D");
}

NS_INLINE UIColor* blueColor()
{
    return colorFromHexString(@"4FBFFF");
}

NS_INLINE UIColor* selectedCellColor()
{
    return colorFromHexString(@"2C2C2D");
}

// Appereance

NS_INLINE void configureUIAppereance()
{
    // Hides back button titles
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    // Back button image
    UIImage *backButtonImage = [UIImage imageNamed:@"BackButton"];

    [[UINavigationBar appearance] setBackIndicatorImage:backButtonImage];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:backButtonImage];

    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0 weight:UIFontWeightLight]}];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0 weight:UIFontWeightLight]}
                                                forState:UIControlStateNormal];
    
    [UIActivityIndicatorView appearanceWhenContainedIn:[UINavigationBar class], nil].color = [UIColor whiteColor];
}