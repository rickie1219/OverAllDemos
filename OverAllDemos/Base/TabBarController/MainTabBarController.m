//
//  MainTabBarController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MainTabBarController.h"

#import "BaseNavigationController.h"

/// 四个主要的tabBar页面控制器
#import "HomeViewController.h"
#import "MallViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"

#import "TabBarItem.h"


@interface MainTabBarController ()<TabBarDelegate>

@property (nonatomic,strong) NSMutableArray *VCS;//tabbar root VC

@end

@implementation MainTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化tabbar
    [self setUpTabBar];
    
    //添加子控制器
    [self setUpAllChildViewController];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self removeOriginControls];
}

#pragma mark ————— 初始化TabBar —————
- (void)setUpTabBar
{
    [self.tabBar addSubview:({
        
        TabBar *tabBar = [[TabBar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        
        self.TabBar = tabBar;
    })];
    
}
#pragma mark - ——————— 初始化VC ————————
- (void)setUpAllChildViewController
{
    _VCS = @[].mutableCopy;
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_apple" seleceImageName:@"icon_apple_selected"];
    
    MallViewController *mallVC = [[MallViewController alloc] init];
    [self setupChildViewController:mallVC title:@"商城" imageName:@"icon_appstore" seleceImageName:@"icon_appstore_selected"];
    
    DiscoverViewController *discoverVC = [DiscoverViewController new];
    [self setupChildViewController:discoverVC title:@"发现" imageName:@"icon_github" seleceImageName:@"icon_github_selected"];
    
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_html5" seleceImageName:@"icon_html5_selected"];
    
    self.viewControllers = _VCS;
    
}

- (void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName
{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    //controller.tabBarItem.badgeValue = (_VCS.count % 2 == 0) ? @"100" : @"1";
    
    //包装导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:controller];
    controller.title = title;
    // 添加到控制器数组中
    [_VCS addObject:nav];
}

#pragma mark ————— 统一设置tabBarItem属性并添加到TabBar —————
- (void)setViewControllers:(NSArray *)viewControllers
{
    self.TabBar.badgeTitleFont         = SYSTEMFONT(11.0f);
    self.TabBar.itemTitleFont          = SYSTEMFONT(10.0f);
    self.TabBar.itemImageRatio         = self.itemImageRatio == 0 ? 0.7 : self.itemImageRatio;
    self.TabBar.itemTitleColor         = cItemTitleColor;
    self.TabBar.selectedItemTitleColor = cItemTitleColorSelected;
    self.TabBar.tabBarItemCount = viewControllers.count;
    
    
    [viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIViewController *VC = (UIViewController *)obj;
        
        UIImage *selectedImage = VC.tabBarItem.selectedImage;
        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self addChildViewController:VC];
        
        [self.TabBar addTabBarItem:VC.tabBarItem];
    }];
}

#pragma mark ————— 选中某个tab —————
- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    self.TabBar.selectedItem.selected = NO;
    self.TabBar.selectedItem = self.TabBar.tabBarItems[selectedIndex];
    self.TabBar.selectedItem.selected = YES;
}

#pragma mark ————— 取出系统自带的tabbar并把里面的按钮删除掉 —————
- (void)removeOriginControls
{
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        
        if ([obj isKindOfClass:[UIControl class]]) {
            
            [obj removeFromSuperview];
        }
    }];
}


#pragma mark - TabBarDelegate Method

- (void)tabBar:(TabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to
{
    // 从一个tabBar到选中另一个tabBar
    self.selectedIndex = to;
}


- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}


- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}





@end
