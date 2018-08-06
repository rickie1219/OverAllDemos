//
//  HomeViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "HomeViewController.h"

#import "MenuViewController.h"
#import "MenuTitleLabel.h"

@interface HomeViewController ()<UIScrollViewDelegate>
{
    NSArray *arrList;
}
/** 标题栏 */
@property (strong, nonatomic) UIScrollView *smallScrollView;
/** 下面的内容栏 */
@property (strong, nonatomic) UIScrollView *bigScrollView;
@end


/**
 首页
 */
@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
   
    
    
    arrList = @[
                @{
                    @"title":@"头条",
                    @"urlString":@"headline/T1348647853363",
                    @"replyUrl":@"3g_bbs"
                    },
                @{
                    @"title":@"NBA",
                    @"urlString":@"list/T1348649145984",
                    @"replyUrl":@"sports_nba_bbs"
                    },
                @{
                    @"title":@"手机",
                    @"urlString":@"list/T1348649654285",
                    @"replyUrl":@"mobile_bbs"
                    },
                @{
                    @"title":@"移动互联",
                    @"urlString":@"list/T1351233117091",
                    @"replyUrl":@"mobile_bbs"
                    },
                @{
                    @"title":@"娱乐",
                    @"urlString":@"list/T1348648517839",
                    @"replyUrl":@"auto_bbs"
                    },
                @{
                    @"title":@"时尚",
                    @"urlString":@"list/T1348650593803",
                    @"replyUrl":@"lady_bbs"
                    },
                @{
                    @"title":@"电影",
                    @"urlString":@"list/T1348648650048",
                    @"replyUrl":@"ent2_bbs"
                    },
                @{
                    @"title":@"科技",
                    @"urlString":@"list/T1348649580692",
                    @"replyUrl":@"tech_bbs"
                    }
                ];
    
    
    /** 标题栏 */
    self.smallScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    self.smallScrollView.showsHorizontalScrollIndicator = NO;
    self.smallScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.smallScrollView];
    
    /** 下面的内容栏 */
    self.bigScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,  CGRectGetMaxY(self.smallScrollView.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - kTopHeight - CGRectGetHeight(self.smallScrollView.frame) - kTabBarHeight)];
    self.bigScrollView.delegate = self;
    [self.view addSubview:self.bigScrollView];
    
    [self addMenuBarSubViewControllers];
    [self addLable];
    
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.bigScrollView.contentSize = CGSizeMake(contentX, 0);
    self.bigScrollView.pagingEnabled = YES;
    
    
    // 添加默认控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:vc.view];
    MenuTitleLabel *lable = [self.smallScrollView.subviews firstObject];
    lable.scale = 1.0;
    self.bigScrollView.showsHorizontalScrollIndicator = NO;
    
    
}




#pragma mark - 添加子控制器
- (void)addMenuBarSubViewControllers
{
    for (int i = 0 ; i < arrList.count ;i++)
    {
        // 创建对应标题栏下的控制器
        MenuViewController *vc1 = [[MenuViewController alloc] init];
        vc1.title = arrList[i][@"title"];
        vc1.urlString = arrList[i][@"urlString"];
        [self addChildViewController:vc1];
    }
}

#pragma mark /** 添加标题栏 */
- (void)addLable
{
    CGFloat lblW = 70;
    CGFloat lblH = 40;
    CGFloat lblY = 0;
    CGFloat lblX = 0;
    for (int i = 0; i < arrList.count; i++) {
        //CGFloat lblW = 70;
        //CGFloat lblH = 40;
        //CGFloat lblY = 0;
        lblX = i * lblW;
        MenuTitleLabel *lbl1 = [[MenuTitleLabel alloc] init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text = vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [self.smallScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        // 给label添加手势动作，触发点击方法
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lblClick:)]];
    }
    self.smallScrollView.contentSize = CGSizeMake(lblW * arrList.count, 0);
    
}

#pragma mark /** 标题栏label的点击事件 */
- (void)lblClick:(UITapGestureRecognizer *)recognizer
{
    MenuTitleLabel *titlelable = (MenuTitleLabel *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * self.bigScrollView.frame.size.width;
    CGFloat offsetY = self.bigScrollView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    
    [self.bigScrollView setContentOffset:offset animated:YES];
}

#pragma mark - ******************** scrollView代理方法
/** 滚动结束后调用（代码导致） */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    
    // 滚动标题栏
    MenuTitleLabel *titleLable = (MenuTitleLabel *)self.smallScrollView.subviews[index];
    
    CGFloat offsetx = titleLable.center.x - self.smallScrollView.frame.size.width * 0.5;
    
    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
    if (offsetx < 0)
    {
        offsetx = 0;
    }
    else if (offsetx > offsetMax)
    {
        offsetx = offsetMax;
    }
    
    CGPoint offset = CGPointMake(offsetx, self.smallScrollView.contentOffset.y);
    [self.smallScrollView setContentOffset:offset animated:YES];
    // 添加控制器
    MenuViewController *newsVc = self.childViewControllers[index];
    newsVc.index = index;
    
    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index)
        {
            MenuTitleLabel *temlabel = self.smallScrollView.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    
    if (newsVc.view.superview) return;
    
    // 设置子控制器的frame
    newsVc.view.frame = scrollView.bounds;
    [self.bigScrollView addSubview:newsVc.view];
}

/** 滚动结束（手势导致） */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    MenuTitleLabel *labelLeft = self.smallScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScrollView.subviews.count)
    {
        MenuTitleLabel *labelRight = self.smallScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
}


@end
