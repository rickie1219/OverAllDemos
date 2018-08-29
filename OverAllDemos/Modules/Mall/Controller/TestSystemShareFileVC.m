//
//  TestSystemShareFileVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/16.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestSystemShareFileVC.h"

/*
 作者：冒泡的我
 链接：https://www.jianshu.com/p/0eab27a076ed
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */

@interface TestSystemShareFileVC ()

@end

@implementation TestSystemShareFileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btnURL = [UIButton buttonWithType:UIButtonTypeCustom];
    btnURL.frame = CGRectMake((self.view.frame.size.width - 200)/2, 150, 200, 80);
    btnURL.backgroundColor = [UIColor cyanColor];
    [btnURL setTitle:@"share URL" forState:UIControlStateNormal];
    [btnURL addTarget:self action:@selector(shareURL) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnURL];
    
    
    UIButton *btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    btnImage.frame = CGRectMake((self.view.frame.size.width - 200)/2, CGRectGetMaxY(btnURL.frame)+20, 200, 80);
    btnImage.backgroundColor = [UIColor orangeColor];
    [btnImage setTitle:@"Share Image" forState:UIControlStateNormal];
    [btnImage addTarget:self action:@selector(shareImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnImage];
    
}

/// 系统的方式分享链接
- (void)shareURL
{
    NSString *shareText = @"sharetitle";
    UIImage *shareImage = [UIImage imageNamed:@"img_ltc.png"];
    NSURL *shareURL = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSArray *activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage,shareURL, nil];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        NSLog(@"%@",activityType);
        if (completed) {
            NSLog(@"分享成功");
        } else {
            NSLog(@"分享失败");
        }
        [vc dismissViewControllerAnimated:YES completion:nil];
    };
    
    vc.completionWithItemsHandler = myBlock;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}


/// 系统的方式分享图片
- (void)shareImage
{
    NSData *date = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201403/21/20140321140348_sifsf.jpeg"]];
    NSArray *activityItems = @[date];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
