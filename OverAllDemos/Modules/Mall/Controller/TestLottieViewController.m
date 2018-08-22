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
    UITableView *test_tableView;
}

@end

@implementation TestLottieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
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
                      @"01",
                      @"02",
                      @"03",
                      @"04",
                      @"05",
                      @"06",
                      @"07",
                      @"08",
                      @"09",
                      @"10",
                      @"11",
                      @"12",
                      @"13",
                      @"14",
                      @"15",
                      @"16",
                      @"17",
                      @"18",
                      @"19",
                      @"20"
                      ];
    
    [self initTestTableView];
    
}

- (void)initTestTableView
{
    CGFloat navH = 44;
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = navH + 44;
    } else {
        navH = navH + 20;
    }
    
    test_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navH) style:UITableViewStylePlain];
    test_tableView.delegate = self;
    test_tableView.dataSource = self;
    test_tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:test_tableView];

    test_tableView.rowHeight = 100;

    /*
    self.tableView.mj_header = [TestDIYLottieRefreshHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
     */

    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    test_tableView.mj_header = [TestDIYLottieRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [test_tableView.mj_header beginRefreshing];
}

- (void)refreshData
{
    // 模拟延迟加载数据，因此2秒后才调用（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 结束刷新
        [test_tableView.mj_header endRefreshing];
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
    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld , dataArr = %@", indexPath.row, arrDatasource[indexPath.row]];
    
    return cell;
}





@end
