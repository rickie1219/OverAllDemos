//
//  AppDelegate.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MainTabBarController.h"


/**
 这里面只做调用，具体实现放到 AppDelegate+AppService 或者Manager里面，防止代码过多不清晰
 */
@interface AppDelegate : UIResponder <UIApplicationDelegate>
    
    @property (strong, nonatomic) UIWindow *window;
    
    @property (strong, nonatomic) MainTabBarController *mainTabBar;
@end

