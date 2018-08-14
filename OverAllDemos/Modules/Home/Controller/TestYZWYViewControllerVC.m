//
//  TestYZWYViewControllerVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/10.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestYZWYViewControllerVC.h"

#import "TestYZWYViewControllerSubVC.h"

@interface TestYZWYViewControllerVC ()

@end

@implementation TestYZWYViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"网易新闻";
    
    // 添加所有子控制器
    [self setUpAllViewController];
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *norColor = [UIColor lightGrayColor];
        *selColor = [UIColor blackColor];
        *titleWidth = [UIScreen mainScreen].bounds.size.width / 6;
    }];
    
    // 标题渐变
    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(YZTitleColorGradientStyle *titleColorGradientStyle, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor) {
        //        *norColor = [UIColor blackColor];
        //        *selColor = [UIColor orangeColor];
        //        *titleColorGradientStyle = YZTitleColorGradientStyleFill;
    }];
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        //        *isUnderLineDelayScroll = YES;
        *isUnderLineEqualTitleWidth = YES;
        *underLineColor = [UIColor cyanColor];
    }];
    
    // 字体缩放
    // 推荐方式 (设置字体缩放)
    //    [self setUpTitleScale:^(CGFloat *titleScale) {
    //        // 字体缩放比例
    //        *titleScale = 1.3;
    //    }];
}


// 添加所有子控制器
- (void)setUpAllViewController
{
    
    // 段子
    TestYZWYViewControllerSubVC *wordVc1 = [[TestYZWYViewControllerSubVC alloc] init];
    wordVc1.title = @"小码哥";
    [self addChildViewController:wordVc1];
    
    // 段子
    TestYZWYViewControllerSubVC *wordVc2 = [[TestYZWYViewControllerSubVC alloc] init];
    wordVc2.title = @"M了个J";
    [self addChildViewController:wordVc2];
    
    // 段子
    TestYZWYViewControllerSubVC *wordVc3 = [[TestYZWYViewControllerSubVC alloc] init];
    wordVc3.title = @"啊峥";
    [self addChildViewController:wordVc3];
    
    TestYZWYViewControllerSubVC *wordVc4 = [[TestYZWYViewControllerSubVC alloc] init];
    wordVc4.title = @"吖了个峥";
    [self addChildViewController:wordVc4];
    
    // 全部
    TestYZWYViewControllerSubVC *allVc = [[TestYZWYViewControllerSubVC alloc] init];
    allVc.title = @"全部";
    [self addChildViewController:allVc];
    
    // 视频
    TestYZWYViewControllerSubVC *videoVc = [[TestYZWYViewControllerSubVC alloc] init];
    videoVc.title = @"视频";
    [self addChildViewController:videoVc];
    
    // 声音
    TestYZWYViewControllerSubVC *voiceVc = [[TestYZWYViewControllerSubVC alloc] init];
    voiceVc.title = @"声音";
    [self addChildViewController:voiceVc];
    
    // 图片
    TestYZWYViewControllerSubVC *pictureVc = [[TestYZWYViewControllerSubVC alloc] init];
    pictureVc.title = @"图片";
    [self addChildViewController:pictureVc];
    
    // 段子
    TestYZWYViewControllerSubVC *wordVc = [[TestYZWYViewControllerSubVC alloc] init];
    wordVc.title = @"段子";
    [self addChildViewController:wordVc];
    
    
    
}


@end
