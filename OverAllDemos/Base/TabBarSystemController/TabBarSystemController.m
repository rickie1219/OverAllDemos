//
//  TabBarSystemController.m
//  DemoForAll
//
//  Created by Rickie_Lambert on 2018/1/23.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TabBarSystemController.h"

#import "HomeViewController.h"
#import "MallViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

/// 定义控制器的五个参数，1.类名 2.nav和tabBar标题 3.正常状态下的图标 4.选中状态下的图标 5.消息未读数量
#define TabbarVC                @"vc"
#define TabbarTitle             @"title"
#define TabbarImage             @"image"
#define TabbarSelectedImage     @"selectedImage"
#define TabbarItemBadgeValue    @"badgeValue"
/// 定义一下tabBar的个数
#define TabBarCount 4

/// 定义一个枚举，枚举出tabBar类的类型
typedef NS_ENUM (NSInteger, TabBarSystemType) {
    TabBarSystemTypeHome,       //首页
    TabBarSystemTypeMall,       //商城
    TabBarSystemTypeDiscover,   //发现
    TabBarSystemTypeMine,       //我的
};


/**
 使用系统的tabBar功能
 */
@interface TabBarSystemController ()

/** 定义一个配置类型的字典*/
@property (nonatomic, copy) NSDictionary *configs;

@end

@implementation TabBarSystemController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 封装一个方法：只要传入四个tab页的类名，就可以了
    
    //[self setupTabBarItems];
    [self configTabBarAndSubNav];
}



- (NSArray *)tabbars
{
    // 根据tabBar的个数，初始化一个tabBar的数组
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (NSInteger tabbar = 0; tabbar < TabBarCount; tabbar++) {
        [items addObject:@(tabbar)];
    }
    return items;
}


- (void)configTabBarAndSubNav
{
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    [self.tabbars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // 根据配置控制器信息来获取对应的tabBar信息
        NSDictionary *item =[self configVCInfoForTabBarType:[obj integerValue]];
        // 从tabBar的字典中获取对应Key的值
        NSString *vcName = item[TabbarVC];
        NSString *title  = item[TabbarTitle];
        NSString *imageName = item[TabbarImage];
        NSString *imageSelected = item[TabbarSelectedImage];
        
        // 拿到控制器类名
        Class clazz = NSClassFromString(vcName);
        // 创建控制器
        UIViewController *vc = [[clazz alloc] initWithNibName:nil bundle:nil];
        vc.hidesBottomBarWhenPushed = NO;
        // 添加导航栏
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        // 根据对应的 key-value 值来创建 tabBarItem
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:[UIImage imageNamed:imageName]
                                               selectedImage:[UIImage imageNamed:imageSelected]];
        // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
        // 设置正常状态下的tabBarItem字体颜色
        NSDictionary *dictNormal = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
        // 设置选中状态下的tabBarItem字体颜色
        NSDictionary *dictSelected = [NSDictionary dictionaryWithObject:[UIColor colorWithRed:242/255.0 green:38/255.0 blue:70/255.0 alpha:1.0] forKey:NSForegroundColorAttributeName];
        [nav.tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
        [nav.tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
        // 设置tabBarItem的图片颜色也不被系统默认渲染，显示自定义颜色
        UIImage *imgNormal = [UIImage imageNamed:imageName];
        imgNormal = [imgNormal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [nav.tabBarItem setImage:imgNormal];
        // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
        UIImage *imgSelected = [UIImage imageNamed:imageSelected];
        imgSelected = [imgSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [nav.tabBarItem setSelectedImage:imgSelected];
        // 将tabBarItem的tag值赋值
        nav.tabBarItem.tag = idx;
        
        // 获取到tabBar的badge值
        NSInteger badge = [item[TabbarItemBadgeValue] integerValue];
        if (badge) {
            // 如果badge有值，就赋值给tabBarItem
            nav.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",badge];
        }
        // 将导航栏控制器添加到控制器数组中
        [vcArray addObject:nav];
    }];
    // 最后，将创建好的tabBarVC的数组赋值给MainTabBarController
    self.viewControllers = [NSArray arrayWithArray:vcArray];
}


#pragma mark - VC 控制器配置基本信息
- (NSDictionary *)configVCInfoForTabBarType:(TabBarSystemType)type
{
    if (_configs == nil)
    {
        _configs = @{
                     @(TabBarSystemTypeHome) : @{
                             TabbarVC           : @"HomeViewController",
                             TabbarTitle        : @"云信",
                             TabbarImage        : @"icon_apple",
                             TabbarSelectedImage: @"icon_apple_selected",
                             TabbarItemBadgeValue: @(0)
                             },
                     @(TabBarSystemTypeMall)     : @{
                             TabbarVC           : @"MallViewController",
                             TabbarTitle        : @"通讯录",
                             TabbarImage        : @"icon_appstore",
                             TabbarSelectedImage: @"icon_appstore_selected",
                             TabbarItemBadgeValue: @(99)
                             },
                     @(TabBarSystemTypeDiscover): @{
                             TabbarVC           : @"DiscoverViewController",
                             TabbarTitle        : @"直播间",
                             TabbarImage        : @"icon_github",
                             TabbarSelectedImage: @"icon_github_selected",
                             },
                     @(TabBarSystemTypeMine)     : @{
                             TabbarVC           : @"MineViewController",
                             TabbarTitle        : @"设置",
                             TabbarImage        : @"icon_html5",
                             TabbarSelectedImage: @"icon_html5_selected",
                             TabbarItemBadgeValue: @(0)
                             }
                     };
        
    }
    return _configs[@(type)];
}

/**
 * 封装一个方法
 * 传入控制器、标题、正常状态下图片、选中状态下图片
 * 直接调用这个方法就可以了
 */
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage
{
    // 下面两行代码是修改tabbar的颜色
    //UITabBar *tabBar = [UITabBar appearance];
    //[tabBar setBarTintColor:[UIColor cyanColor]];
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
    UIImage *imageHome = [UIImage imageNamed:selectedImage];
    imageHome = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [controller.tabBarItem setSelectedImage:imageHome];
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
}



@end
