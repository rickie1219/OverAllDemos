//
//  TestPPSnapshotHandlerVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/17.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerVC.h"

#import "TestPPSnapshotHandlerScrollViewVC.h"
#import "TestPPSnapshotHandlerWKWebViewVC.h"
#import "TestPPSnapshotHandlerUIWebViewVC.h"
#import "TestPPSnapshotHandlerUIViewVC.h"



@interface TestPPSnapshotHandlerVC ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *pp_tableView;
    NSArray *arrTestVCs;
}

@end

@implementation TestPPSnapshotHandlerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 设置列表
    arrTestVCs = @[
                   @{
                       @"className" : @"TestPPSnapshotHandlerScrollViewVC",
                       @"title"     : @"01.测试ScrollViewVC视图"
                       },
                   @{
                       @"className" : @"TestPPSnapshotHandlerWKWebViewVC",
                       @"title"     : @"02.测试WKWebViewVC视图"
                       },
                   @{
                       @"className" : @"TestPPSnapshotHandlerUIWebViewVC",
                       @"title"     : @"03.测试UIWebViewVC视图"
                       },
                   @{
                       @"className" : @"TestPPSnapshotHandlerUIViewVC",
                       @"title"     : @"04.测试UIViewVC视图"
                       }
                   ];
    
    CGFloat iPhoneX_Height = 812;
    
    if (iPhoneX_Height == [UIScreen mainScreen].bounds.size.height) {
        pp_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44-44) style:UITableViewStylePlain];
    } else {
        pp_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    }
    
    
    pp_tableView.delegate = self;
    pp_tableView.dataSource = self;
    pp_tableView.rowHeight = 60;
    pp_tableView.tableFooterView = [UIView new];
    // 一种不错的浅灰色颜色
    //pp_tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    pp_tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:pp_tableView];
    
    
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
