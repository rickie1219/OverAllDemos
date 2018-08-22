//
//  TestDIYLottieRefreshHeader.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//


#import "TestDIYLottieRefreshHeader.h"

static const CGFloat refreshMJTotalH = 80;
static const CGFloat refreshTopMargin = 0;


@interface TestDIYLottieRefreshHeader()
{
    CGFloat refreshViewH;
    LOTAnimationView *_imgLoading;
}
@end

@implementation TestDIYLottieRefreshHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置刷新控件的高度
    self.mj_h = refreshMJTotalH;
    // 设置自定义的视图的高度
    refreshViewH = self.mj_h - refreshTopMargin * 2;
    
    // 获取网络资源的Lottie资源Json文件,加载对号完成的动画
//    NSString *strUrl = @"https://www.lottiefiles.com/storage/datafiles/jEgAWaDrrm6qdJx/data.json";
//    _imgLoading = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:strUrl]];
//    //_imgLoading.frame = CGRectMake((rootView.frame.size.width-50)/2, (rootView.frame.size.height-50)/2, 50, 50);
//    _imgLoading.contentMode = UIViewContentModeScaleAspectFit;
//    [rootView addSubview:_imgLoading];
//    _imgLoading.animationProgress = 0;
//    [_imgLoading play];
//    _imgLoading.loopAnimation = YES;
    
    // 下面是加载lottie本地动画的json文件
    // 小逗号跳跃的动画
    //_imgLoading = [LOTAnimationView animationNamed:@"PinJump"];
    // 五个彩色的点上下波动的动画
    _imgLoading = [LOTAnimationView animationNamed:@"material_wave_loading"];
    // 五个彩色的点放大缩小动画
    //_imgLoading = [LOTAnimationView animationNamed:@"loading_animation_2"];
    // 加载失败
    //_imgLoading = [LOTAnimationView animationNamed:@"car2go_loading_animation"];
    // 一个正方形的加载，从 左下角到右上角的刷新正方形
    //_imgLoading = [LOTAnimationView animationNamed:@"loader_for_1"];
    // 加载失败
    //_imgLoading = [LOTAnimationView animationNamed:@"loader_for_2"];
    // 一窜蓝色的圆圈，实现转圈的动画
    //_imgLoading = [LOTAnimationView animationNamed:@"trail_loading"];
    // 圆形，三角形，正方形，三种形状的弹跳
    //_imgLoading = [LOTAnimationView animationNamed:@"rebote"];
    // 三个圆，呈现三角的旋转，图案比较小
    //_imgLoading = [LOTAnimationView animationNamed:@"loading"];
    // 一条线，灰色背景，黑色进度条来回动
    //_imgLoading = [LOTAnimationView animationNamed:@"loader1"];
    // 一条线，灰色背景，黑色进度条从中间分开向两边加载
    //_imgLoading = [LOTAnimationView animationNamed:@"loader2"];
    // 各种家用工具的图案加载动画
    //_imgLoading = [LOTAnimationView animationNamed:@"servishero_loading"];
    // 五颜六色的小点掉落动画，小点比较小
    //_imgLoading = [LOTAnimationView animationNamed:@"loader_animation"];
    // 一波大中小不同颜色弧线的加载，动画没有循环，只加载了一遍
    //_imgLoading = [LOTAnimationView animationNamed:@"loading_animation"];
    // 三个圆，呈现三角的旋转，图案比较小
    //_imgLoading = [LOTAnimationView animationNamed:@"loading"];
    // 心形的加载图案，加载很快
    //_imgLoading = [LOTAnimationView animationNamed:@"loader_5"];
    // lottie官方动画
    //_imgLoading = [LOTAnimationView animationNamed:@"LottieLogo2"];

    _imgLoading.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imgLoading];
//    _imgLoading.backgroundColor = [UIColor orangeColor];
    _imgLoading.animationProgress = 0;
    [_imgLoading play];
    _imgLoading.loopAnimation = YES;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    // 设置加载动画的视图的frame
    _imgLoading.frame = CGRectMake(0, refreshTopMargin, self.frame.size.width, refreshViewH);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    //NSLog(@"-------- 1111111111111 -------");
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    //NSLog(@"-------- 2222222222222 -------");
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    //NSLog(@"-------- 3333333333333 -------");
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    /**
    / 普通闲置状态 /
    MJRefreshStateIdle = 1,
    / 松开就可以进行刷新的状态 /
    MJRefreshStatePulling,
    / 正在刷新中的状态 /
    MJRefreshStateRefreshing,
    / 即将刷新的状态 /
    MJRefreshStateWillRefresh,
    / 所有数据加载完毕，没有更多的数据了/
    MJRefreshStateNoMoreData
     */
    switch (state) {
        case MJRefreshStateIdle:
            //NSLog(@"---1 刷新 MJRefreshStateIdle");
            [_imgLoading stop];
            break;
        case MJRefreshStatePulling:
            //NSLog(@"---2 刷新 MJRefreshStatePulling");
            [_imgLoading stop];
            break;
        case MJRefreshStateRefreshing:
            //NSLog(@"---3 刷新 MJRefreshStateRefreshing");
            [_imgLoading play];
            break;
        case MJRefreshStateWillRefresh:
            //NSLog(@"---4 刷新 MJRefreshStateRefreshing");
            [_imgLoading stop];
            break;
        case MJRefreshStateNoMoreData:
            //NSLog(@"---5 刷新 MJRefreshStateRefreshing");
            [_imgLoading stop];
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
    
    if (pullingPercent > 1) {
        _imgLoading.animationProgress = 1;
    } else if (pullingPercent < 0) {
        
    } else {
        _imgLoading.animationProgress = pullingPercent;
    }
    
}


@end
