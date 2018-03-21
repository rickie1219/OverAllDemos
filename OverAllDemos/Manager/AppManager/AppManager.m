//
//  AppManager.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "AppManager.h"
#import "AdPageView.h"
#import "BaseWKWebViewController.h"
#import "LoginViewController.h"
#import "YYFPSLabel.h"

@implementation AppManager


+ (void)appStart
{
    //加载广告
    AdPageView *adView = [[AdPageView alloc] initWithFrame:kScreenBounds withTapBlock:^{
        BaseNavigationController *loginNavi = [[BaseNavigationController alloc] initWithRootViewController:[[BaseWKWebViewController alloc] initWithUrl:@"http://www.hao123.com"]];
        [kRootViewController presentViewController:loginNavi animated:YES completion:nil];
    }];
    adView = adView;
}


#pragma mark ————— FPS 监测 —————
+ (void)showFPS
{
    YYFPSLabel *_fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = kScreenHeight - 55;
    _fpsLabel.right = kScreenWidth - 10;
    //    _fpsLabel.alpha = 0;
    [kAppWindow addSubview:_fpsLabel];
}

@end
