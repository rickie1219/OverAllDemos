//
//  TestCreshVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestCreshVC.h"

@interface TestCreshVC ()
{
    BOOL isOkToCrash;
}

@end

@implementation TestCreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化崩溃按钮不可以崩溃
    isOkToCrash = NO;
    
    
    UIButton *btnTestCrash = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTestCrash.frame = CGRectMake((self.view.frame.size.width - 280)/2, 30, 280, 50);
    btnTestCrash.backgroundColor = [UIColor redColor];
    [btnTestCrash setTitle:@"测试崩溃 <慎点!!>" forState:UIControlStateNormal];
    [btnTestCrash setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnTestCrash addTarget:self action:@selector(demoForCrash) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTestCrash];
    
    
    
    /***
     UISwitch *sw = [[UISwitch alloc]initWithFrame:CGRectMake(200, 15, 50, 15)];
     sw.transform = CGAffineTransformMakeScale( 0.5, 0.5);//缩放
     */
    
    UISwitch *btnSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(CGRectGetMinX(btnTestCrash.frame), CGRectGetMaxY(btnTestCrash.frame)+10, btnTestCrash.frame.size.width, btnTestCrash.frame.size.height)];
    //btnSwitch.transform = CGAffineTransformMakeScale( 0.5, 0.5);
    
    /***
     1.1 CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     这个方法可以方便的对view的长和宽进行缩放，不改变view的中心点。注意！中心点不变指的是物理位置不变，不是坐标，因为坐标系此时已经发生改变
     
     1.2 CGAffineTransformScale(CGAffineTransform t,CGFloat sx, CGFloat sy)
     这个方法同样是view的长和宽进行缩放，效果类似CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)不同的是这个方法可以叠加其他CGAffineTransform效果（比如旋转)
     
     作者：ITCodeShare
     链接：https://www.jianshu.com/p/e6ef6eb04c6a
     來源：简书
     简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
     */
    
    [btnSwitch setBackgroundColor:[UIColor cyanColor]];
    [btnSwitch setOnTintColor:[UIColor orangeColor]];
    [btnSwitch setThumbTintColor:[UIColor whiteColor]];
    btnSwitch.layer.cornerRadius = 15.5f;
    btnSwitch.layer.masksToBounds = YES;
    [btnSwitch addTarget:self action:@selector(btnSwitchAction:) forControlEvents:UIControlEventValueChanged];
    // 设置开关状态(默认是 关)
    //btnSwitch.on = YES;
    
    [self.view addSubview:btnSwitch];
    
}


- (void)btnSwitchAction:(UISwitch *)sender
{
    if(sender.isOn){
        NSLog(@"打开");
        isOkToCrash = YES;
    } else {
        NSLog(@"关闭");
        isOkToCrash = NO;
    }
}


#pragma mark - 测试腾讯bugly错误收集
- (void)demoForCrash
{
    if (isOkToCrash) {
        DLog(@"可以崩溃，崩溃吧~~~~");
        NSString *str = nil;
        NSArray *arr = @[@"hello", str];
        DLog(@"%@", arr);
        NSLog(@"%@", arr);
    } else {
        DLog(@"不可以崩溃!");
    }
}

@end
