//
//  XRLoginMainVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "XRLoginMainVC.h"

#import "XRLoginNewUserRegisterVC.h"
#import "XRLoginUserAccountVC.h"
#import "XRLoginLanguageChooseVC.h"

@interface XRLoginMainVC ()
{
    UIButton *_btnRegister;
    UIButton *_btnLogin;
    UIButton *_btnSetLanguage;
}

@end

@implementation XRLoginMainVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 以前的写法
    self.navigationController.navigationBar.hidden = YES;
    // 为避免自定义导航栏可能出现的bug，优化成这种写法 （不好使）
    //[self.navigationController.view sendSubviewToBack:self.navigationController.navigationBar];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 以前的写法
    self.navigationController.navigationBar.hidden = NO;
    // 为避免自定义导航栏可能出现的bug，优化成这种写法 (不好使)
    //[self.navigationController.view bringSubviewToFront:self.navigationController.navigationBar];
}

#pragma mark - 加载视图完成
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置控制器背景颜色和图片
    [self initViewControllerBackground];
    
    // 初始化登录主界面的两个按钮
    [self initLoginMainSubViews];
}

#pragma mark - 设置控制器背景颜色和图片
- (void)initViewControllerBackground
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *img = [UIImage imageNamed:@"bg_login_main_fifth"];
    UIImageView *imgViewShow = [[UIImageView alloc] initWithImage:img];
    imgViewShow.contentMode = UIViewContentModeScaleAspectFit;
    imgViewShow.frame = self.view.bounds;
    [self.view addSubview:imgViewShow];
}

- (void)initLoginMainSubViews
{
    // 获取当前界面的总长度和总高度
    CGFloat totalWidth = self.view.frame.size.width;
    CGFloat totalHeight = self.view.frame.size.height;
    
    // 固定注册用户按钮和登录按钮的间距和高度
    CGFloat marginHorizontal = 20;
    CGFloat marginVertical = 40;
    CGFloat btnHeight = 60;
    CGFloat btnWidth = (totalWidth - marginHorizontal * 3) / 2;
    CGFloat marginLanguageTop = 80;
    CGFloat widthLanguage = 60;
    CGFloat heightLanguage = 40;
    CGFloat marginLanguageRight = totalWidth - marginHorizontal - widthLanguage;
    
    UIColor *bgSkyColor = [UIColor colorWithRed:20/255.0 green:120/255.0 blue:227/255.0 alpha:1];
    UIColor *bgWhiteColor = [UIColor whiteColor];
    
    
    // 语言设置按钮
    _btnSetLanguage = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSetLanguage.frame = CGRectMake(marginLanguageRight, marginLanguageTop, widthLanguage, heightLanguage);
    //_btnSetLanguage.backgroundColor = bgSkyColor;
    [_btnSetLanguage setTitle:@"语言" forState:UIControlStateNormal];
    _btnSetLanguage.titleLabel.font = [UIFont systemFontOfSize:17];
    [_btnSetLanguage setTitleColor:bgSkyColor forState:UIControlStateNormal];
    [_btnSetLanguage addTarget:self action:@selector(skipToLanguageChooseVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSetLanguage];
    
    
    // 注册按钮
    _btnRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnRegister.frame = CGRectMake(marginHorizontal, totalHeight - marginVertical - btnHeight, btnWidth, btnHeight);
    _btnRegister.backgroundColor = bgSkyColor;
    [_btnRegister setTitle:@"Register" forState:UIControlStateNormal];
    _btnRegister.titleLabel.font = [UIFont systemFontOfSize:24];
    [_btnRegister setTitleColor:bgWhiteColor forState:UIControlStateNormal];
    [_btnRegister addTarget:self action:@selector(skipToNewUserRegisterVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnRegister];
    
    // 登录按钮
    _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnLogin.frame = CGRectMake(CGRectGetMaxX(_btnRegister.frame) + marginHorizontal, CGRectGetMinY(_btnRegister.frame), btnWidth, btnHeight);
    _btnLogin.backgroundColor = bgWhiteColor;
    [_btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    _btnLogin.titleLabel.font = [UIFont systemFontOfSize:24];
    [_btnLogin setTitleColor:bgSkyColor forState:UIControlStateNormal];
    [_btnLogin addTarget:self action:@selector(skipToLoginUserAccountVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnLogin];
    _btnLogin.layer.borderWidth = 1;
    _btnLogin.layer.borderColor = bgSkyColor.CGColor;
    
}


#pragma mark - 跳转到语言设置选择的界面
- (void)skipToLanguageChooseVC
{
    XRLoginLanguageChooseVC *vc = [[XRLoginLanguageChooseVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 跳转到新用户注册界面
- (void)skipToNewUserRegisterVC
{
    XRLoginNewUserRegisterVC *vc = [[XRLoginNewUserRegisterVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 跳转到用户登录界面
- (void)skipToLoginUserAccountVC
{
    XRLoginUserAccountVC *vc = [[XRLoginUserAccountVC alloc] init];
    vc.vcTitle = @"用户登录";
    [self.navigationController pushViewController:vc animated:YES];
}


@end
