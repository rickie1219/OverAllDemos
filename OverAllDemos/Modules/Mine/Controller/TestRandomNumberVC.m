//
//  TestRandomNumberVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/1/27.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestRandomNumberVC.h"

@interface TestRandomNumberVC ()
{
    UILabel *lblResult;
    UIButton *btn;
}

@end

@implementation TestRandomNumberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    lblResult = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 50, 280, 100)];
    lblResult.backgroundColor = [UIColor cyanColor];
    lblResult.text = [NSString stringWithFormat:@"暂时没有数字"];
    lblResult.textColor = [UIColor whiteColor];
    lblResult.textAlignment = NSTextAlignmentCenter;
    lblResult.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:lblResult];
    
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 200)/2, CGRectGetMaxY(lblResult.frame)+20, 200, 80);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点击显示随机数1-10" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getRandomNumber:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    // 使用YYKit添加了一个分割线
    UIView *line = [UIView new];
    line.top = CGRectGetMaxY(btn.frame) + 20;
    line.width = self.view.frame.size.width;
    line.height = CGFloatFromPixel(1);
    line.backgroundColor = UIColorHex(bfbfbf);
    line.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:line];
    
    UILabel *lblLine = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, CGRectGetMaxY(line.frame)+10, 200, 50)];
    lblLine.text = @"使用YYKit显示一条分割线";
    [self.view addSubview:lblLine];
}



- (void)getRandomNumber:(UIButton *)sender
{
    NSString *strNum = [NSString stringWithFormat:@"%d", [self getRandomNumber:1 to:10]];
    NSLog(@"随机数是 = %@", strNum);
    lblResult.text = strNum;
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
