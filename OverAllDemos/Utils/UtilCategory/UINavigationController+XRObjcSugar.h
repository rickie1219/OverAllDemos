//
//  UINavigationController+XRObjcSugar.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/7.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (XRObjcSugar)


/// 自定义全屏拖拽返回手势
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *xr_popGestureRecognizer;



@end
