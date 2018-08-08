//
//  TestBase64HashCodeViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/9.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestBase64HashCodeViewController.h"

@interface TestBase64HashCodeViewController ()
{
    UIButton *btnBase64;
    UIButton *btnHash;
    UILabel *lblBefore;
    UILabel *lblResult;
    UILabel *lblHash;
    
    BOOL isFirstBase64Click;
    BOOL isFirstHashClick;
}

@end

@implementation TestBase64HashCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    isFirstBase64Click = YES;
    isFirstHashClick = YES;
    
    btnBase64 = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBase64.frame = CGRectMake((self.view.frame.size.width - 160*2 - 10*3)/2, (self.view.frame.size.height - 50 - 20 - kNavBarHeight- kTabBarHeight), 160, 50);
    btnBase64.backgroundColor = [UIColor yellowColor];
    [btnBase64 setTitle:@"Base64 Code" forState:UIControlStateNormal];
    [btnBase64 addTarget:self action:@selector(encodeStringWithBase64:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBase64];
    
    btnHash = [UIButton buttonWithType:UIButtonTypeCustom];
    btnHash.frame = CGRectMake(CGRectGetMaxX(btnBase64.frame)+10, CGRectGetMinY(btnBase64.frame), btnBase64.frame.size.width, btnBase64.frame.size.height);
    btnHash.backgroundColor = [UIColor cyanColor];
    [btnHash setTitle:@"Hash Code" forState:UIControlStateNormal];
    [btnHash addTarget:self action:@selector(encodeStringWithHash:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHash];
    
    
    lblBefore = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 320)/2, 80, 320, 50)];
    lblBefore.backgroundColor = [UIColor orangeColor];
    lblBefore.text = @"ceshi密码加密功能334411";
    lblBefore.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblBefore];
    
    UILabel *lblShow = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lblBefore.frame), CGRectGetMaxY(lblBefore.frame)+20, lblBefore.frame.size.width, 20)];
    lblShow.text = @"Result Below: ";
    lblShow.backgroundColor = [UIColor grayColor];
    [self.view addSubview:lblShow];
    
    lblResult = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lblBefore.frame), CGRectGetMaxY(lblShow.frame)+20, lblBefore.frame.size.width, lblBefore.frame.size.height*2)];
    lblResult.numberOfLines = 0;
    lblResult.backgroundColor = [UIColor redColor];
    lblResult.text = @"No Command";
    lblResult.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblResult];
    
    lblHash = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lblResult.frame), CGRectGetMaxY(lblResult.frame)+20, lblResult.frame.size.width, lblResult.frame.size.height*2)];
    lblHash.numberOfLines = 0;
    lblHash.backgroundColor = [UIColor greenColor];
    lblHash.text = @"No Command";
    lblHash.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lblHash];
    
}


- (void)encodeStringWithBase64:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    if (isFirstBase64Click) {
        // base64字符串加密
//        NSString *result = [lblBefore.text hm_base64encode];
//        lblResult.text = [NSString stringWithFormat:@"%@",result];
//        sender.selected = !sender.selected;
    } else {
        if (sender.selected) {
            NSLog(@"lblResult.text = %@", lblResult.text);
            // base64字符串解密
//            NSString *result = [lblResult.text hm_base64decode];
//            lblResult.text = [NSString stringWithFormat:@"%@",result];
        } else {
            // base64字符串加密
//            NSString *result = [lblResult.text hm_base64encode];
//            lblResult.text = [NSString stringWithFormat:@"%@",result];
        }
    }
    
    isFirstBase64Click = NO;
}


- (void)encodeStringWithHash:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    NSString *result = [lblBefore.text sha512String];
    NSLog(@"result 加密01 = %@", result);
    lblHash.text = [NSString stringWithFormat:@"%@",result];
    
    
//    if (isFirstHashClick) {
//        // hash加密SHA512
//        NSString *result = [lblBefore.text sha512String];
//        NSLog(@"result 加密01 = %@", result);
//        lblHash.text = [NSString stringWithFormat:@"%@",result];
//        sender.selected = !sender.selected;
//    } else {
//        if (!sender.selected) {
//            // hash加密SHA512
//            NSString *result = [lblHash.text sha512String];
//            NSLog(@"result 加密02 = %@", result);
//            lblHash.text = [NSString stringWithFormat:@"%@",result];
//        } else {
//            NSLog(@"lblHash.text = %@", lblHash.text);
//            // hash解密SHA512
//            NSString *result = [lblHash.text hmacSHA512StringWithKey:lblHash.text];
//            NSLog(@"result 解密02 = %@", result);
//            lblHash.text = [NSString stringWithFormat:@"%@",result];
//        }
//    }
//    isFirstHashClick = NO;
}

@end
