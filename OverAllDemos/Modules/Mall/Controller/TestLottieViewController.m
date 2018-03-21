//
//  TestLottieViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/2.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLottieViewController.h"

#import "TestDIYLottieRefreshHeader.h"

@interface TestLottieViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *arrDatasource;
    LOTAnimationView *lottieAnimation;
}

@end

@implementation TestLottieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取网络资源的Lottie资源Json文件
//    NSString *strUrl = @"https://www.lottiefiles.com/storage/datafiles/Y95p1QxekMZhR3m/data.json";
//
//    lottieAnimation = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:strUrl]];
//    lottieAnimation.contentMode = UIViewContentModeScaleAspectFill;
//    lottieAnimation.frame = self.view.bounds;
//    [self.view addSubview:lottieAnimation];
//    lottieAnimation.animationProgress = 0;
//    [lottieAnimation play];
//    lottieAnimation.loopAnimation = YES;
    arrDatasource = @[
                      @"11",
                      @"22",
                      @"33",
                      @"44",
                      @"55",
                      @"66",
                      @"77",
                      @"88",
                      @"99"
                      ];
    
    self.tableView.rowHeight = 100;
//    self.tableView.mj_header = [TestDIYLottieRefreshHeader headerWithRefreshingBlock:^{
//        [self refreshData];
//    }];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.mj_header = [TestDIYLottieRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [self.tableView.mj_header beginRefreshing];
    
}

- (void)refreshData
{
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    });
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrDatasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld", indexPath.row];
    
    return cell;
}





@end
