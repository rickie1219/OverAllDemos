//
//  TestCutRoundCornerVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/28.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestCutRoundCornerVC.h"

@interface TestCutRoundCornerVC ()
{
    UIView *viewUseCornerRadius;
    UIView *viewUseRectCornerShapeLayer;
    UIView *viewUseGraphics;
}

@end

@implementation TestCutRoundCornerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 方法一
    [self makeRoundCornersWithCornerRadius];
    
    // 方法二
    [self makeRoundCornerWithCAShapeLayerAndBazierPath];
    
    // 方法三
    [self makeRoundCornerWithUIBezierPathAndGraphics];
}

#pragma mark - 方法一:对圆角直接进行裁剪(对性能消耗最大)
- (void)makeRoundCornersWithCornerRadius
{
    viewUseCornerRadius = [[UIView alloc] initWithFrame:CGRectMake(100, 64, 200, 150)];
    viewUseCornerRadius.backgroundColor = [UIColor orangeColor];
    // 只需要设置layer层的两个属性
    // 设置圆角
    viewUseCornerRadius.layer.cornerRadius = viewUseCornerRadius.frame.size.height/2;
    // 将多余的部分切掉
    viewUseCornerRadius.layer.masksToBounds = YES;
    [self.view addSubview:viewUseCornerRadius];
}

#pragma mark - 方法二:使用CAShapeLayer和UIBazierPath设置圆角
- (void)makeRoundCornerWithCAShapeLayerAndBazierPath
{
    viewUseRectCornerShapeLayer = [[UIView alloc] initWithFrame:CGRectMake(120, 250, 150, 100)];
    viewUseRectCornerShapeLayer.backgroundColor = [UIColor blueColor];
    // 设置贝塞尔路径
    viewUseRectCornerShapeLayer.layer.mask = [self createViewWithRect:viewUseRectCornerShapeLayer.bounds bgColor:[UIColor purpleColor] byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:viewUseRectCornerShapeLayer.bounds.size];
    
    [self.view addSubview:viewUseRectCornerShapeLayer];
}

#pragma mark - 封装一个方法,视图调用以后,通过传入的参数,设置视图的四个边角为圆角
- (CAShapeLayer *)createViewWithRect:(CGRect)bounds bgColor:(UIColor *)bgColor byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    // 写一个枚举, 根据传入的视图是什么样的UIView, 进行不一样的设置
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    // 把布局返回回去
    return maskLayer;
}


#pragma mark - 方法三:使用贝塞尔曲线UIBezierPath和Core Graphics框架画圆
- (void)makeRoundCornerWithUIBezierPathAndGraphics
{
    viewUseGraphics = [[UIView alloc] initWithFrame:CGRectMake(100, 400, 200, 100)];
    viewUseGraphics.backgroundColor = [UIColor cyanColor];
    UIGraphicsGetCurrentContext();
    // 开始对UIView进行画图
    UIGraphicsBeginImageContextWithOptions(viewUseGraphics.bounds.size, NO, 1.0);
    // 使用贝赛尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:viewUseGraphics.bounds cornerRadius:viewUseGraphics.bounds.size.width] addClip];
    [viewUseGraphics drawRect:viewUseGraphics.bounds];
    //    UIGraphicsGetImageFromCurrentImageContext();
    
    
    //    viewUseGraphics = UIGraphicsGetImageFromCurrentImageContext();
    // 结束画图
    UIGraphicsEndImageContext();
    [self.view addSubview:viewUseGraphics];
    
}

@end
