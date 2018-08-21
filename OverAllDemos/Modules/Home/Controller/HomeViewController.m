//
//  HomeViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "HomeViewController.h"

#import "TestMenuListVC.h"
#import "TestZJAnimationPopViewVC.h"
#import "TestYZWYViewControllerVC.h"
#import "TestPPSnapshotHandlerVC.h"
#import "TestWKWebViewVC.h"


@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *m_tableView;
    NSArray *arrTestVCs;
}


@end


/**
 首页
 */
@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 设置列表
    arrTestVCs = @[
                   @{
                       @"className" : @"TestMenuListVC",
                       @"title"     : @"00.多个菜单页面切换"
                       },
                   @{
                       @"className" : @"TestZJAnimationPopViewVC",
                       @"title"     : @"01.测试多种弹出框提示效果"
                       },
                   @{
                       @"className" : @"TestYZWYViewControllerVC",
                       @"title"     : @"02.测试网易新闻的多个菜单页面切换"
                       },
                   @{
                       @"className" : @"TestPPSnapshotHandlerVC",
                       @"title"     : @"03.测试网页|滚动视图|一般视图的截图功能"
                       },
                   @{
                       @"className" : @"TestWKWebViewVC",
                       @"title"     : @"04.测试WKWebView"
                       }
                   ];
    
    CGFloat iPhoneX_Height = 812;
    
    if (iPhoneX_Height == [UIScreen mainScreen].bounds.size.height) {
        m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44-44-49-34) style:UITableViewStylePlain];
    } else {
        m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49-64) style:UITableViewStylePlain];
    }
    
    
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    m_tableView.rowHeight = 60;
    m_tableView.tableFooterView = [UIView new];
    // 一种不错的浅灰色颜色
    //m_tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    m_tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:m_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrTestVCs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    // 配置cell的标题内容
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. = %@", (long)indexPath.row, arrTestVCs[indexPath.row] [@"className"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"标题 -> %@",  arrTestVCs[indexPath.row] [@"title"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取到子控制器的名字，然后声明创建该子控制器
    BaseViewController *vc = [NSClassFromString(arrTestVCs[indexPath.row] [@"className"]) new];
    // 如果是首页和分类，导航栏标题就为空
    vc.title = [NSString stringWithFormat:@"%@", arrTestVCs[indexPath.row] [@"title"]];
    //vc.navigationItem.prompt = [NSString stringWithFormat:@"%@", arrTestVCs[indexPath.row] [@"className"]];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
