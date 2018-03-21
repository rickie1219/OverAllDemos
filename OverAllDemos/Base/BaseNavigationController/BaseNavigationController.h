//
//  BaseNavigationController.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 导航控制器基类
 */
@interface BaseNavigationController : UINavigationController

/*!
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
- (BOOL)popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated;

@end
