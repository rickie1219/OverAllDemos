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
}

@end

@implementation TestPPSnapshotHandlerScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"截图" style:UIBarButtonItemStyleDone target:self action:@selector(toCaptureScreenShotAction)];
    self.navigationItem.rightBarButtonItem = btnItem;
    
    
    
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
    [self.view addSubview:t_scrollView];
    
    
    CGFloat contentOffSetY = t_scrollView.frame.size.height;
    t_scrollView.contentSize = CGSizeMake(t_scrollView.frame.size.width, contentOffSetY * 9);
    t_scrollView.contentOffset = CGPointMake(0, contentOffSetY);
    
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
    
    [PPSnapshotHandler.defaultHandler snapshotForView:self.tableView];
}

#pragma mark - PPSnapshotHandlerDelegate

- (void)snapshotHandler:(PPSnapshotHandler *)snapshotHandler didFinish:(UIImage *)captureImage forView:(UIView *)view
{
    PPSnapshotHandler.defaultHandler.delegate = nil;
    
    _screenshotImage = captureImage;
    
    TestPPSnapshotHandlerImageShowVC *vc = [[TestPPSnapshotHandlerImageShowVC alloc] init];
    vc.capturedImage = _screenshotImage;
    vc.title = @"截图";
    [self.navigationController pushViewController:vc animated:YES];
}


@end
