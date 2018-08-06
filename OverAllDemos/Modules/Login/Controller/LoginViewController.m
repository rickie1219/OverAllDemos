//
//  LoginViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "LoginViewController.h"
#import <UMSocialCore/UMSocialCore.h>

@interface LoginViewController ()
{
    UIImageView *imgViewLogo;
    UITextField *tfAccount;
    UITextField *tfPassword;
    UIButton    *btnLogin;
    UIButton    *btnRegister;
}

@end

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"登录";
    
    
    // 测试登录
    [self initTestLoginUI];
    
    // 登录界面
    [self initLoginSubviewsUI];
}

- (void)initLoginSubviewsUI
{
    // 设置密码输入框为中心位置
    tfPassword = [[UITextField alloc] init];
}

- (void)viewDidLayoutSubviews
{
    
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
