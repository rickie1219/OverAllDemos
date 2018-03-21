//
//  TestDIYLottieRefreshHeader.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//


#import "TestDIYLottieRefreshHeader.h"


@interface TestDIYLottieRefreshHeader()


@property (weak, nonatomic) LOTAnimationView *imgLoading;

@end

@implementation TestDIYLottieRefreshHeader


#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 80)];
    v.backgroundColor = [UIColor yellowColor];
    [self addSubview:v];
    
    _imgLoading = [LOTAnimationView animationNamed:@"PinJump"];
    _imgLoading.contentMode = UIViewContentModeScaleAspectFit;
    [_imgLoading play];
    _imgLoading.loopAnimation = YES;
    _imgLoading.frame = v.bounds;
    [v addSubview:_imgLoading];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    _imgLoading.frame = CGRectMake(50, 10, 150, 80);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [_imgLoading stop];
            break;
        case MJRefreshStatePulling:
            [_imgLoading stop];
            break;
        case MJRefreshStateRefreshing:
            [_imgLoading play];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
    CGFloat red = 1.0 - pullingPercent * 0.5;
    CGFloat green = 0.5 - 0.5 * pullingPercent;
    CGFloat blue = 0.5 * pullingPercent;
    
    NSLog(@" pullingPercent = %.2f", pullingPercent);
    _imgLoading.animationProgress = pullingPercent;
}


@end
