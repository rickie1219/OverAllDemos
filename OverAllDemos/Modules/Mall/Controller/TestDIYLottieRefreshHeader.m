//
//  TestDIYLottieRefreshHeader.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//


#import "TestDIYLottieRefreshHeader.h"


@interface TestDIYLottieRefreshHeader()
{
    UIView *rootView;
}


@property (strong, nonatomic) LOTAnimationView *imgLoading;

@end

@implementation TestDIYLottieRefreshHeader


#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 100;
    
    
    rootView = [[UIView alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 300)/2, 10, 300, 80)];
    rootView.backgroundColor = [UIColor yellowColor];
    [self addSubview:rootView];
    
    UIImage *img = [UIImage imageNamed:@"101.jpeg"];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:img];
    imgV.frame = CGRectMake((rootView.frame.size.width-200)/2, (rootView.frame.size.height-60)/2, 200, 60);
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    [rootView addSubview:imgV];
    
    // 获取网络资源的Lottie资源Json文件
    NSString *strUrl = @"https://www.lottiefiles.com/storage/datafiles/jEgAWaDrrm6qdJx/data.json";
    
    _imgLoading = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:strUrl]];
    //_imgLoading.frame = CGRectMake((rootView.frame.size.width-50)/2, (rootView.frame.size.height-50)/2, 50, 50);
    _imgLoading.contentMode = UIViewContentModeScaleAspectFit;
    [rootView addSubview:_imgLoading];
    _imgLoading.animationProgress = 0;
    [_imgLoading play];
    _imgLoading.loopAnimation = YES;
    
//    _imgLoading = [LOTAnimationView animationNamed:@"PinJump"];
//    _imgLoading.contentMode = UIViewContentModeScaleAspectFit;
//    [_imgLoading play];
//    _imgLoading.loopAnimation = YES;
//    _imgLoading.frame = v.bounds;
//    [v addSubview:_imgLoading];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    _imgLoading.frame = CGRectMake((rootView.frame.size.width-100)/2, (rootView.frame.size.height-80)/2, 100, 80);
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
            NSLog(@"---1 刷新 MJRefreshStateIdle");
            [_imgLoading stop];
            break;
        case MJRefreshStatePulling:
            NSLog(@"---2 刷新 MJRefreshStatePulling");
            [_imgLoading stop];
            break;
        case MJRefreshStateRefreshing:
            NSLog(@"---3 刷新 MJRefreshStateRefreshing");
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
