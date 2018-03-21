//
//  BaseWKWebViewController.h
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "XLWebViewController.h"

@interface BaseWKWebViewController : XLWebViewController

//在多级跳转后，是否在返回按钮右侧展示关闭按钮
@property (nonatomic, assign) BOOL isShowCloseBtn;

@end
