//
//  TestNSUserDefaultsVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/1/27.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestNSUserDefaultsVC.h"

@interface TestNSUserDefaultsVC ()<UITextFieldDelegate>
{
    UITextField *tfInput;
    UIButton *btnSave;
}

@end

@implementation TestNSUserDefaultsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    tfInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 140, self.view.frame.size.width - 160, 50)];
    tfInput.delegate = self;
    tfInput.placeholder = @"请输入要保存的内容";
    tfInput.returnKeyType = UIReturnKeyDefault; //设置按键类型
    tfInput.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
    // 设置背景颜色
    tfInput.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:tfInput];
    
    
    // 通过 standardUserDefaults获取共享的NSUserDefaults对象。
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 从NSUserDefaults中的读取key为words的对象，并赋值给NSString
    NSString *strWords = [defaults stringForKey:@"words"];
    // 用NSString设置TextField的text属性
    tfInput.text = strWords;
    
    
    btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.frame = CGRectMake(CGRectGetMinX(tfInput.frame), CGRectGetMaxY(tfInput.frame) + 30, tfInput.frame.size.width, tfInput.frame.size.height);
    btnSave.backgroundColor = [UIColor orangeColor];
    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
    [btnSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(toSaveInputContent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
}

- (void)toSaveInputContent:(UIButton *)sender
{
    // 收起键盘，释放键盘
    [tfInput resignFirstResponder];
    // 获取NSUserDefaults对象
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 将输入的文本内容保存到NSUserDefaults对象。
    [userDefaults setObject:tfInput.text forKey:@"words"];
    // synchronize方法手动将NSUserDefaults对象的改变保存到 userDefaults 数据库。
    [userDefaults synchronize];
    
    
    // 退出程序
    // exit(0);
}


@end
