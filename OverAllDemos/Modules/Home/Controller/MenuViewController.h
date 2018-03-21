//
//  MenuViewController.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/1/23.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "BaseViewController.h"

@interface MenuViewController : BaseViewController
/** 标题 */
@property (nonatomic, strong) NSString *menuTitle;

/** url链接地址 url端口 */
@property (nonatomic, strong) NSString *urlString;

/** 控制器索引 */
@property (nonatomic, assign) NSInteger index;
@end
