//
//  MainTabBarController.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TabBar.h"

#import <QMUIKit/QMUITabBarViewController.h>

/**
 底部 TabBar 控制器
 */
@interface MainTabBarController : QMUITabBarViewController


/**
 *  TabBar
 */
@property (nonatomic, strong) TabBar *TabBar;

/**
 * tabbar 图片占比，默认 0.7f， 如果是1 就没有文字
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  System will display the original controls so you should call this line when you change any tabBar item, like: `- popToRootViewController`, `someViewController.tabBarItem.title = xx`, etc.
 *  Remove origin controls
 */
- (void)removeOriginControls;


@end
