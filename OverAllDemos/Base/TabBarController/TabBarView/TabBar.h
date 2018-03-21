//
//  TabBar.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TabBar, TabBarItem;

//给每个按钮定义协议 与 方法
@protocol TabBarDelegate <NSObject>

@optional
- (void)tabBar:(TabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end



/**
 tabBar
 */
@interface TabBar : UIView

/**
 *  TabBar item title color
 */
@property (nonatomic, strong) UIColor *itemTitleColor;

/**
 *  TabBar selected item title color
 */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/**
 *  TabBar item title font
 */
@property (nonatomic, strong) UIFont *itemTitleFont;

/**
 *  TabBar item's badge title font
 */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/**
 *  TabBar item image ratio
 */
@property (nonatomic, assign) CGFloat itemImageRatio;

/**
 *  TabBar's item count
 */
@property (nonatomic, assign) NSInteger tabBarItemCount;

/**
 *  TabBar's selected item
 */
@property (nonatomic, strong) TabBarItem *selectedItem;

/**
 *  TabBar items array
 */
@property (nonatomic, strong) NSMutableArray *tabBarItems;

/**
 *  TabBar delegate
 */
@property (nonatomic, weak) id<TabBarDelegate> delegate;

/**
 *  Add tabBar item
 */
- (void)addTabBarItem:(UITabBarItem *)item;



@end
