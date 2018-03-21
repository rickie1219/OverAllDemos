//
//  TestKVOReceiveValueViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/14.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestKVOReceiveValueViewController.h"

#import "TestKVOPassValueViewController.h"

#import "Person.h"
#import "Person+TestRuntimeProperty.h"

@interface TestKVOReceiveValueViewController ()
{
    UILabel *lblShow;
    TestKVOPassValueViewController *passValueVC;
}

@end

@implementation TestKVOReceiveValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // KVO传值： 在A页面设置B页面的变量second，并且对这个变量进行观察
    
    lblShow = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 280)/2, 80, 280, 50)];
    lblShow.textAlignment = NSTextAlignmentCenter;
    lblShow.text = @"Test KVO";
    lblShow.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lblShow];
    
    // 测试类扩展中，添加属性， hobby是类扩展中的扩展属性
    Person *person = [[Person alloc] init];
    person.name = @"ssssss";
    person.age = 18;
    person.hobby = @"xxxxx";
    
    
    UIButton *btnPush = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPush.frame = CGRectMake(CGRectGetMinX(lblShow.frame), CGRectGetMaxY(lblShow.frame) + 20, lblShow.frame.size.width, lblShow.frame.size.height);
    [btnPush setTitle:@"Push" forState:UIControlStateNormal];
    [btnPush addTarget:self action:@selector(toPushNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPush];
    
}

- (void)toPushNextVC
{
    passValueVC = [[TestKVOPassValueViewController alloc] init];
    [self.navigationController pushViewController:passValueVC animated:YES];
}

@end
