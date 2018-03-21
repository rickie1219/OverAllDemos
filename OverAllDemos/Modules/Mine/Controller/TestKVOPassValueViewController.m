//
//  TestKVOPassValueViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/14.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestKVOPassValueViewController.h"

@interface TestKVOPassValueViewController ()
{
    UIButton *btn;
}

@end

@implementation TestKVOPassValueViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 280)/2, 80, 280, 80);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击显示随机数1-10" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getRandomNumber:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


- (void)getRandomNumber:(UIButton *)sender
{
    NSString *strNum = [NSString stringWithFormat:@"%d", [self getRandomNumber:1 to:10]];
    NSLog(@"随机数是 = %@", strNum);
    
}

#pragma mark 获取一个随机整数
- (int)getRandomNumber:(int)from to:(int)to

{
    // (to - from + 1),result is [from to];
    return (int)(from + (arc4random() % (to - from + 1)) );
    // else (to - from) 范围在[from,to），包括from，不包括to, is [from, to)!!!!!!!
    //return (int)(from + (arc4random() % (to - from)));
}



@end
