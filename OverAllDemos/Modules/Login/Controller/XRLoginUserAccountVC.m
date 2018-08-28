//
//  XRLoginUserAccountVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "XRLoginUserAccountVC.h"

@interface XRLoginUserAccountVC ()

@end

@implementation XRLoginUserAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 测试登录
    [self initTestLoginUI];
    
}

- (void)initConfigViewControllerWithLargerTitle:(NSString *)strLargerTitle
{
    UILabel *lblLagerTitle = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 300, 80)];
    lblLagerTitle.text = strLargerTitle;
    lblLagerTitle.textColor = [UIColor blueColor];
    lblLagerTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblLagerTitle];
    
}

- (void)initTestLoginUI
{
    YYLabel *snowBtn = [[YYLabel alloc] initWithFrame:CGRectMake(0, 200, 150, 60)];
    snowBtn.text = @"微信登录";
    snowBtn.font = SYSTEMFONT(20);
    snowBtn.textColor = kWhiteColor;
    snowBtn.backgroundColor = cNavBgColor;
    snowBtn.textAlignment = NSTextAlignmentCenter;
    snowBtn.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    snowBtn.centerX = kScreenWidth/2;
    
    kWeakSelf(self);
    snowBtn.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        //        [MBProgressHUD showTopTipMessage:NSStringFormat(@"%@马上开始",str) isWindow:YES];
        
        [weakself WXLogin];
    };
    
    [self.view addSubview:snowBtn];
    
    YYLabel *snowBtn2 = [[YYLabel alloc] initWithFrame:CGRectMake(0, 300, 150, 60)];
    snowBtn2.text = @"QQ登录";
    snowBtn2.font = SYSTEMFONT(20);
    snowBtn2.textColor = kWhiteColor;
    snowBtn2.backgroundColor = kRedColor;
    snowBtn2.textAlignment = NSTextAlignmentCenter;
    snowBtn2.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    snowBtn2.centerX = kScreenWidth/2;
    
    snowBtn2.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        //        [MBProgressHUD showTopTipMessage:NSStringFormat(@"%@马上开始",str) isWindow:YES];
        
        [weakself QQLogin];
    };
    
    [self.view addSubview:snowBtn2];
    
    YYLabel *skipBtn = [[YYLabel alloc] initWithFrame:CGRectMake(0, 400, 150, 60)];
    skipBtn.text = @"跳过登录";
    skipBtn.font = SYSTEMFONT(20);
    skipBtn.textColor = kBlueColor;
    skipBtn.backgroundColor = kClearColor;
    skipBtn.textAlignment = NSTextAlignmentCenter;
    skipBtn.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    skipBtn.centerX = kScreenWidth/2;
    
    skipBtn.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        //        [MBProgressHUD showTopTipMessage:NSStringFormat(@"%@马上开始",str) isWindow:YES];
        
        [weakself skipAction];
    };
    
    [self.view addSubview:skipBtn];
}


- (void)WXLogin
{
    [userManager login:kUserLoginTypeWeChat completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}

- (void)QQLogin
{
    [userManager login:kUserLoginTypeQQ completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}

- (void)skipAction
{
    KPostNotification(KNotificationLoginStateChange, @YES);
}



@end
