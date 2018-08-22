//
//  TestPPSnapshotHandlerScrollViewTableViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/22.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerScrollViewTableViewVC.h"

#import "TestPPSnapshotHandlerImageShowVC.h"
#import "PPSnapshotHandler.h"

@interface TestPPSnapshotHandlerScrollViewTableViewVC ()<PPSnapshotHandlerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UITableView *t_tableView;
    UIImage *_screenshotImage;
    UIBarButtonItem *btnItem;
    NSArray *arrData;
}

@end

@implementation TestPPSnapshotHandlerScrollViewTableViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    arrData = @[
                @{@"title":@"这是测试滚动视图0"},
                @{@"title":@"这是测试滚动视图1"},
                @{@"title":@"这是测试滚动视图2"},
                @{@"title":@"这是测试滚动视图3"},
                @{@"title":@"这是测试滚动视图4"},
                @{@"title":@"这是测试滚动视图5"},
                @{@"title":@"这是测试滚动视图6"},
                @{@"title":@"这是测试滚动视图7"},
                @{@"title":@"这是测试滚动视图8"},
                @{@"title":@"这是测试滚动视图9"},
                @{@"title":@"这是测试滚动视图10"},
                @{@"title":@"这是测试滚动视图11"},
                @{@"title":@"这是测试滚动视图12"},
                @{@"title":@"这是测试滚动视图13"},
                @{@"title":@"这是测试滚动视图14"},
                @{@"title":@"这是测试滚动视图15"},
                @{@"title":@"这是测试滚动视图16"},
                @{@"title":@"这是测试滚动视图17"},
                @{@"title":@"这是测试滚动视图18"},
                @{@"title":@"这是测试滚动视图19"},
                @{@"title":@"这是测试滚动视图20"},
                @{@"title":@"这是测试滚动视图21"}
                ];
    
    
    [self initConfigTableView];
}


- (void)initConfigTableView
{
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = 44 + 44;
    } else {
        navH = 44 + 20;
    }
    
    t_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navH)];
    t_tableView.delegate = self;
    t_tableView.dataSource = self;
    t_tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:t_tableView];
    
}

#pragma mark - datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strId = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld- %@", indexPath.row, [arrData[indexPath.row] objectForKey:@"title"]];
    return cell;
}

#pragma mark - talbeView delegate UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did selected %ld cell", indexPath.row);
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
    [PPSnapshotHandler.defaultHandler snapshotForView:t_tableView];
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
