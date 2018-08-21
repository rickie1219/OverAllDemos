//
//  TestPPSnapshotHandlerUIViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/17.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerUIViewVC.h"

#import "PPSnapshotHandler.h"
#import "TestPPSnapshotHandlerImageShowVC.h"

@interface TestPPSnapshotHandlerUIViewVC ()<PPSnapshotHandlerDelegate>
{
    UIView *_testViewCapture;
    UIImage *_imgCaptured;
    UIBarButtonItem *btnItem;
}


@end

@implementation TestPPSnapshotHandlerUIViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initConfigNormalView];
}


- (void)initConfigNormalView
{
    // 判断是否是iPhone X的导航栏
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = navH + 44;
    } else {
        navH = navH + 20;
    }
    
    _testViewCapture = [[UIView alloc] initWithFrame:CGRectMake(20, 50, self.view.frame.size.width - 20*2, self.view.frame.size.height - 50*2 - navH)];
    _testViewCapture.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_testViewCapture];
    
    // 在测试的正常视图上，再添加两个视图
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _testViewCapture.frame.size.width, 50)];
    lbl.text = @"This is a normal UIView test";
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.backgroundColor = [UIColor cyanColor];
    [_testViewCapture addSubview:lbl];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"101.jpeg"]];
    imgV.frame = CGRectMake(0, CGRectGetMaxY(lbl.frame)+10, _testViewCapture.frame.size.width, _testViewCapture.frame.size.height-CGRectGetMaxY(lbl.frame)-10);
    imgV.contentMode = UIViewContentModeScaleAspectFit;
    [_testViewCapture addSubview:imgV];
    
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
    [PPSnapshotHandler.defaultHandler snapshotForView:_testViewCapture];
    
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
