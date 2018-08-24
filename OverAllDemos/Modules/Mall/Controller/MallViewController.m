//
//  MallViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MallViewController.h"


#import "TestMallFirstVC.h"
#import "TestCreshVC.h"
#import "TestNSPredicateVC.h"
#import "TestTableViewCellEditModeVC.h"
#import "TestSystemShareFileVC.h"
#import "TestRollingAdvertisementVC.h"


@interface MallViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *m_tableView;
    NSArray *arrTestVCs;
}


@end

@implementation MallViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 设置列表
    arrTestVCs = @[
                   @{
                       @"className" : @"TestMallFirstVC",
                       @"title"     : @"00.测试Lottie动画"
                       },
                   @{
                       @"className" : @"TestCreshVC",
                       @"title"     : @"01.测试崩溃后bugly的日志"
                       },
                   @{
                       @"className" : @"TestNSPredicateVC",
                       @"title"     : @"02.测试谓词的使用"
                       },
                   @{
                       @"className" : @"TestTableViewCellEditModeVC",
                       @"title"     : @"03.测试TableViewCell的编辑功能"
                       },
                   @{
                       @"className" : @"TestSystemShareFileVC",
                       @"title"     : @"04.测试系统分享文件"
                       },
                   @{
                       @"className" : @"TestRollingAdvertisementVC",
                       @"title"     : @"05.测试广告消息的轮播"
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
