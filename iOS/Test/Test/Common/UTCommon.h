//
//  UTCommon.h
//  Express
//
//  Created by Utopia on 16/3/15.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#ifndef UTCommon_h
#define UTCommon_h

//the commmonly used
#define UTScreenHeight [[UIScreen mainScreen] bounds].size.height
#define UTScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UTTabBarHeight self.tabBarController.tabBar.bounds.size.height
#define UTTabBarWidth self.tabBarController.tabBar.bounds.size.width
#define UTNavigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define UTStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak

//Color
#define UTBlueColor [UIColor colorWithRed:0.09 green:0.44 blue:0.71 alpha:1]
#define UTDisableColor [UIColor hx_colorWithHexRGBAString:@"#7d7f81"]

//The Commonly import
#import <CocoaLumberjack/CocoaLumberjack.h>
#define LOG_LEVEL_DEF ddLogLevel
static const DDLogLevel ddLogLevel = DDLogLevelAll;
#import "HexColors.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSObject+TCIdentifier.h"
#import <AFNetworking/AFNetworking.h>

#endif /* UTCommon_h */
