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
    
    // 设置启动图动画和广告页动画有定时器冲突
    // 设置启动图的动画
    //[self animationsForLaunchImage];
    
    // 广告页
    [AppManager appStart];
    
    
    // 版本检测更新
    [self checkAppVersionAndUpdate];
    
    return YES;
}

#pragma mark - 全局收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.window endEditing:YES];
}

#pragma mark - 设置启动图的一个渐渐消失的动效
- (void)animationsForLaunchImage
{
    /**传统的方式，需要根据各种机型的尺寸去处理不同的图片，
     该方式在每每有新机型出现的时候，弊端就及其明显，
     这里主要借鉴了Stack Overflow上的一篇文章
     (http://stackoverflow.com/users/1320010/cherpak-evgeny)，
     通过获取LaunchImage来通配性的加上简易的过渡动画*/
    
    //获取窗口尺寸
    CGSize viewSize = self.window.bounds.size;
    //默认应用为竖屏
    //横屏请设置成 @"Landscape"
    NSString *viewOrientation = @"Portrait";
    NSString *launchImageName = nil;
    //获取LaunchImage的信息数组
    NSArray *launchimagesArr = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    //快速遍历包含启动页信息的数组
    for (NSDictionary *dict in launchimagesArr)
    {
        //拿到启动页的图片尺寸大小
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        //图片尺寸与窗口尺寸一致并且方向关键信息也一致时
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            //满足上述条件时，持有下此时的启动图片名称
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    
    //实例一个跟启动页一样的伪启动页launchView
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImageName]];
    launchView.frame = self.window.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    //将其加载Window上
    [self.window addSubview:launchView];
    //设置动画将伪启动页逐渐透明和移除，实现启动页渐渐消失的简易过渡动画
    [UIView animateWithDuration:2.0f
                          delay:0.0f
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         //动画效果
                         launchView.alpha = 0.0f;
                         launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
                     }
                     completion:^(BOOL finished) {
                         //动画效果完成后，移除伪启动页
                         [launchView removeFromSuperview];
                     }];
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
