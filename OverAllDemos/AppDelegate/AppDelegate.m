//
//  AppDelegate.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "AppDelegate.h"

#import <Bugly/Bugly.h>

@interface AppDelegate ()
    
@end

@implementation AppDelegate
    
    
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 初始化Bugly,使用腾讯bugly进行异常错误日志收集
    [Bugly startWithAppId:@"dc27522f8f"];
    
    //初始化window
    [self initWindow];
    
    //UMeng初始化
    [self initUMeng];
    
    //初始化app服务
    [self initService];
    
    //初始化IM
    [[IMManager sharedIMManager] initIM];
    
    //初始化用户系统
    [self initUserManager];
    
    //网络监听
    [self monitorNetworkStatus];
    
    //广告页
    [AppManager appStart];
    
    
    // 版本检测更新
    [self checkAppVersionAndUpdate];
    
    return YES;
}

#pragma mark - 全局收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.window endEditing:YES];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // 设置APP进入后台后，展示毛玻璃效果
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.visualEffectView.alpha = 1;
    self.visualEffectView.frame = self.window.frame;
    [self.window addSubview:self.visualEffectView];
    [UIView animateWithDuration:0.2 animations:^{
        self.visualEffectView.alpha = 1;
    }];
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    // 设置毛玻璃效果,当APP进入活跃状态的时候，就让毛玻璃视图的透明度变为0，完成以后，就移除毛玻璃视图
    [UIView animateWithDuration:0.2 animations:^{
        self.visualEffectView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.visualEffectView removeFromSuperview];
    }];
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
