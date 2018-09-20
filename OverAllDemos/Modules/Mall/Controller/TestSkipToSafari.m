//
//  TestSkipToSafari.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/9/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestSkipToSafari.h"

@interface TestSkipToSafari ()

@end

@implementation TestSkipToSafari

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btnSkip = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSkip.frame = CGRectMake((self.view.frame.size.width - 280)/2, 30, 280, 50);
    btnSkip.backgroundColor = [UIColor redColor];
    [btnSkip setTitle:@"测试跳转到Safari" forState:UIControlStateNormal];
    [btnSkip setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSkip addTarget:self action:@selector(skipToSafari) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSkip];
    
    
}

- (void)skipToSafari
{
    // app跳转打开safari 跳转打开指定设置的网页
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http:www.baidu.com"]];
}


@end
