//
//  DimensMacros.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/19.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#ifndef DimensMacros_h
#define DimensMacros_h



// 定义尺寸类的宏
// 获取系统对象
#define kApplication            [UIApplication sharedApplication]
#define kAppWindow              [UIApplication sharedApplication].delegate.window
#define kAppDelegate            [AppDelegate shareAppDelegate]
#define kRootViewController     [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]


// 为了适配iOS 11和iPhone X
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

// 获取屏幕宽高
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height
#define kScreenBounds           [UIScreen mainScreen].bounds

#define kIphone6ScaleWidth      KScreenWidth/375.0
#define kIphone6ScaleHeight     KScreenHeight/667.0

// 根据ip6的屏幕来拉伸
#define kRealValue(with) ((with)*(KScreenWidth/375.0f))

// 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]



#endif /* DimensMacros_h */
