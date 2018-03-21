//
//  TestTextfieldViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/12.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestTextfieldViewController.h"

@interface TestTextfieldViewController ()<UITextFieldDelegate>
{
    UITextField *accountTextField;
    UITextField *passwordTextField;
    
    UITextField *noneTextfield;
    UITextField *bazelTextfield;
}

@end

@implementation TestTextfieldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat margin = 20;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - margin * 2;
    
    accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(margin, 80, width, 50)];
    accountTextField.borderStyle = UITextBorderStyleRoundedRect;
    accountTextField.placeholder = @"UITextBorderStyleRoundedRect";
    accountTextField.delegate = self;
    [self.view addSubview:accountTextField];
    
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(accountTextField.frame), CGRectGetMaxY(accountTextField.frame)+20, accountTextField.frame.size.width, accountTextField.frame.size.height)];
    passwordTextField.borderStyle = UITextBorderStyleLine;
    passwordTextField.placeholder = @"UITextBorderStyleLine";
    passwordTextField.delegate = self;
    [self.view addSubview:passwordTextField];
    
    noneTextfield = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(passwordTextField.frame), CGRectGetMaxY(passwordTextField.frame)+20, passwordTextField.frame.size.width, passwordTextField.frame.size.height)];
    noneTextfield.borderStyle = UITextBorderStyleNone;
    noneTextfield.placeholder = @"UITextBorderStyleNone";
    noneTextfield.delegate = self;
    [self.view addSubview:noneTextfield];
    
    bazelTextfield = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(noneTextfield.frame), CGRectGetMaxY(noneTextfield.frame)+20, noneTextfield.frame.size.width, noneTextfield.frame.size.height)];
    bazelTextfield.borderStyle = UITextBorderStyleBezel;
    bazelTextfield.placeholder = @"UITextBorderStyleBezel";
    bazelTextfield.delegate = self;
    [self.view addSubview:bazelTextfield];
    
}

- (void)racDemo
{
    
}




@end
