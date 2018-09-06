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
    //[self initTestLoginUI];
    
    [self initConfigViewControllerWithLargerTitle:@"手机号码登录"];
    [self initConfigLoginButtons];
    
}

- (void)initConfigViewControllerWithLargerTitle:(NSString *)strLargerTitle
{
    UILabel *lblLagerTitle = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 300)/2, 80, 300, 80)];
    lblLagerTitle.text = strLargerTitle;
    lblLagerTitle.textColor = [UIColor blackColor];
    lblLagerTitle.textAlignment = NSTextAlignmentCenter;
    lblLagerTitle.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:lblLagerTitle];
}

- (void)initConfigLoginButtons
{
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = navH + 44;
    } else {
        navH = navH + 20;
    }
    CGFloat midHeight = ([UIScreen mainScreen].bounds.size.height - navH) / 2;
    CGFloat btnWidth = 300;
    YYLabel *btnLogin = [[YYLabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - btnWidth)/2, midHeight, btnWidth, 60)];
    btnLogin.text = @"Login";
    btnLogin.font = SYSTEMFONT(30);
    btnLogin.textColor = kWhiteColor;
    btnLogin.backgroundColor = cNavBgColor;
    btnLogin.textAlignment = NSTextAlignmentCenter;
    btnLogin.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    btnLogin.centerX = kScreenWidth/2;
    kWeakSelf(self);
    btnLogin.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        [weakself toLoginAction];
    };
    [self.view addSubview:btnLogin];
    
    YYLabel *btnSkip = [[YYLabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnLogin.frame)+20, btnWidth, 60)];
    btnSkip.text = @"跳过登录";
    btnSkip.font = SYSTEMFONT(30);
    btnSkip.textColor = kBlueColor;
    btnSkip.backgroundColor = kClearColor;
    btnSkip.textAlignment = NSTextAlignmentCenter;
    btnSkip.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    btnSkip.centerX = kScreenWidth/2;
    btnSkip.textTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        [weakself skipAction];
    };
    [self.view addSubview:btnSkip];
}

- (void)toLoginAction
{
    NSLog(@"----- Login -----");
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
