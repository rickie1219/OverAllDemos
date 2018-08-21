//
//  TestPPSnapshotHandlerScrollViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/17.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerScrollViewVC.h"


#import "TestPPSnapshotHandlerImageShowVC.h"
#import "PPSnapshotHandler.h"

@interface TestPPSnapshotHandlerScrollViewVC ()<PPSnapshotHandlerDelegate, UIScrollViewDelegate>
{
    UIScrollView *t_scrollView;
    UIImage *_screenshotImage;
    UIBarButtonItem *btnItem;
}

@end

@implementation TestPPSnapshotHandlerScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initConfigScrollView];
}


- (void)initConfigScrollView
{
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = 44 + 44;
    } else {
        navH = 44 + 20;
    }
    
    t_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navH)];
    t_scrollView.delegate = self;
    t_scrollView.pagingEnabled = YES;
    t_scrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:t_scrollView];
    
    
    // 这里截图是纵向的截图，想办法将 PPSnapshotHandler 支持横向的截长图
    CGFloat contentOffSetY = t_scrollView.frame.size.height;
    t_scrollView.contentSize = CGSizeMake(t_scrollView.frame.size.width, contentOffSetY * 9);
    t_scrollView.contentOffset = CGPointMake(0, 0);
    
    for (int i = 0; i < 9; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, contentOffSetY * i, t_scrollView.frame.size.width, t_scrollView.frame.size.height)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"10%d.jpeg", i + 1]];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        [t_scrollView addSubview:imgView];
    }
}


#pragma mark - 截图按钮的操作方法
- (void)toCaptureScreenShotAction
{
    NSLog(@"截长图了");
    PPSnapshotHandler.defaultHandler.delegate = self;
    /**
     // 将要进行截图的视图对象作为参数，传进去，别传错了对象，传错了，会导致系统报错
     [Unknown process name] CGContextSaveGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
     之前我把参数传成self.tableView了，所以报上面的错误，也获取不到需要截图的视图
     */
    [PPSnapshotHandler.defaultHandler snapshotForView:t_scrollView];
}

#pragma mark - PPSnapshotHandlerDelegate

- (void)snapshotHandler:(PPSnapshotHandler *)snapshotHandler didFinish:(UIImage *)captureImage forView:(UIView *)view
{
    PPSnapshotHandler.defaultHandler.delegate = nil;
    // 把截到的图片赋值给全局变量
    _screenshotImage = captureImage;
    
    TestPPSnapshotHandlerImageShowVC *vc = [[TestPPSnapshotHandlerImageShowVC alloc] init];
    vc.capturedImage = _screenshotImage;
    vc.title = @"截图";
    // 将截图按钮的点击置为不可点击，不让用户重复点击
    btnItem.enabled = NO;
    
    // 延迟1秒跳转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:vc animated:YES];
    });
}

#pragma mark - 在当前控制器即将出现的时候，将按钮的点击置为可以点击
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    btnItem = [[UIBarButtonItem alloc] initWithTitle:@"截图" style:UIBarButtonItemStyleDone target:self action:@selector(toCaptureScreenShotAction)];
    self.navigationItem.rightBarButtonItem = btnItem;
    btnItem.enabled = YES;
}


@end
