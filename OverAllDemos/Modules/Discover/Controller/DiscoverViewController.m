//
//  DiscoverViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "DiscoverViewController.h"


// 使用方法一：隐藏TabBar时需要引用的头文件
#import "UITabBarController+tabBarController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 280)/2, 80, 280, 80);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"Hide TabBar OFF" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(toHideTabBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    
    
}

- (void)toHideTabBar:(UIButton *)sender
{
    NSLog(@"✨sender.selected = %d", sender.selected);
    NSLog(@"🍎sender.isSelected = %d", sender.isSelected);
    /// 这里btn只有两种属性，一种选中一种不选中，我们每次点击都是想获取与当前相反的状态。
    sender.selected = !sender.isSelected;
    if (sender.selected) {
        NSLog(@"sender.selected = %d", sender.selected);
        NSLog(@"sender.isSelected = %d", sender.isSelected);
        NSLog(@"按钮打开 On");
        [sender setTitle:@"Hide TabBar ON" forState:UIControlStateNormal];
        // 方法一：类扩展写的一个隐藏tabBar的方法
        //[self.tabBarController hideTabBar:YES animated:YES];
        // 方法二：
        [self setTabBarHidden:YES animated:YES];
    } else {
        NSLog(@"sender.selected = %d", sender.selected);
        NSLog(@"sender.isSelected = %d", sender.isSelected);
        NSLog(@"按钮关闭 Off");
        [sender setTitle:@"Hide TabBar OFF" forState:UIControlStateNormal];
        // 方法一：类扩展写的一个隐藏tabBar的方法
        //[self.tabBarController hideTabBar:NO animated:YES];
        // 方法二：
        [self setTabBarHidden:NO animated:YES];
    }
}


/**
 *  hidden tabbar and do animated
 */
- (void)setTabBarHidden:(BOOL)isHidden animated:(BOOL)animated
{
    NSTimeInterval time = animated ? 0.3 : 0.0;
    // 根据传入的参数是否隐藏，来决定tabBar是否隐藏
    if (isHidden)
    {
        // isHidden = YES, 隐藏底部tabBar
        CGFloat h = self.tabBarController.tabBar.frame.size.height;
        [UIView animateWithDuration:time-0.1 animations:^{
            self.tabBarController.tabBar.transform = CGAffineTransformMakeTranslation(0,h);
        } completion:^(BOOL finished) {
            self.tabBarController.tabBar.hidden = YES;
        }];
    }
    else
    {
        // isHidden = NO, 显示底部tabBar
        self.tabBarController.tabBar.hidden = NO;
        [UIView animateWithDuration:time animations:^{
            self.tabBarController.tabBar.transform = CGAffineTransformIdentity;
        }];
    }
}



@end
