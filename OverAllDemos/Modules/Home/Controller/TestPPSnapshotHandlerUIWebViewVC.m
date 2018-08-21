//
//  TestPPSnapshotHandlerUIWebViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/17.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerUIWebViewVC.h"

#import "PPSnapshotHandler.h"
#import "TestPPSnapshotHandlerImageShowVC.h"

@interface TestPPSnapshotHandlerUIWebViewVC ()<PPSnapshotHandlerDelegate>
{
    UIWebView *_uiWebCaptureView;
    UIImage *_imgCaptured;
    UIBarButtonItem *btnItem;
}


@end

@implementation TestPPSnapshotHandlerUIWebViewVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initConfigWKWebView];
    
}


- (void)initConfigWKWebView
{
    // 加载链接的地址
    NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com/"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    _uiWebCaptureView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _uiWebCaptureView.backgroundColor = [UIColor orangeColor];
    [_uiWebCaptureView loadRequest:urlRequest];
    
    [self.view addSubview:_uiWebCaptureView];
}


#pragma mark - 截图按钮的操作方法
- (void)toCaptureScreenShotAction
{
    NSLog(@"截长图了");
    
    PPSnapshotHandler.defaultHandler.delegate = self;
    
    /**
     // 将要进行截图的视图对象作为参数，传进去，别传错了对象，传错了，会导致系统报错
     [Unknown process name] CGContextSaveGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
     */
    [PPSnapshotHandler.defaultHandler snapshotForView:_uiWebCaptureView];
    
}

#pragma mark - PPSnapshotHandlerDelegate

- (void)snapshotHandler:(PPSnapshotHandler *)snapshotHandler didFinish:(UIImage *)captureImage forView:(UIView *)view
{
    PPSnapshotHandler.defaultHandler.delegate = nil;
    // 把截到的图片赋值给全局变量
    _imgCaptured = captureImage;
    
    TestPPSnapshotHandlerImageShowVC *vc = [[TestPPSnapshotHandlerImageShowVC alloc] init];
    vc.capturedImage = _imgCaptured;
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
