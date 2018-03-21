//
//  MenuViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/1/23.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 随机背景颜色
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    
    
}


@end
