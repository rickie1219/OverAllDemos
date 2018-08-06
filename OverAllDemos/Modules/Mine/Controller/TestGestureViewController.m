//
//  TestGestureViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/5/23.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestGestureViewController.h"

@interface TestGestureViewController ()
{
    UIImageView *imageView;
    UITapGestureRecognizer *tap;
    UISwipeGestureRecognizer *swipe;
}

@end

@implementation TestGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIImage *img = [UIImage imageNamed:@"img_index_02bg"];
    
    imageView = [[UIImageView alloc] initWithImage:img];
    
    imageView.frame = CGRectMake(20, 20, (self.view.frame.size.width - 20*2), (self.view.frame.size.height - 20*2));
    imageView.userInteractionEnabled = YES;
    imageView.layer.borderWidth = 1;
    imageView.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addSubview:imageView];
    
    /**
     *  手势 1、轻拍 tap
     */
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    // 设置轻拍次数（默认1）
    tap.numberOfTapsRequired = 2;
    
    // 设置轻拍的手指个数（默认1）
    tap.numberOfTouchesRequired = 2;
    [imageView addGestureRecognizer:tap];
    
    /**
     *  手势 2、轻扫 swipe
     */
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    
    // 设置轻扫的方向
#warning 注意：水平或者垂直方向只能选择一个方向。（默认是水平方向）
    // 设置水平方向
    //    swipe.direction = UISwipeGestureRecognizerDirectionLeft|UISwipeGestureRecognizerDirectionRight;
    // 设置垂直方向
    swipe.direction = UISwipeGestureRecognizerDirectionUp|UISwipeGestureRecognizerDirectionDown;
    // 设置轻扫手指个数：调试手指个数，用Alt（option）调出手指模拟，shift+Alt 固定手指
    // 设置触发这个手势所需要的手指个数
    swipe.numberOfTouchesRequired = 1;
    [imageView addGestureRecognizer:swipe];
}



#pragma mark 第一个：轻拍 tap
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"被轻拍");
}

#pragma mark 第二个：轻扫 swipe
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"被轻扫");
}


@end
