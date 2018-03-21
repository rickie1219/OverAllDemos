//
//  TestHeaderImageScaleViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/6.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestHeaderImageScaleViewController.h"




@interface TestHeaderImageScaleViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_arrDatasource;
    UIImageView *_headerView;
}

@end

@implementation TestHeaderImageScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initSubviews
{
    [super initSubviews];
    
    _headerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"onepiece24"]];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _headerView;
    [self.view addSubview:_tableView];
}

- (void)viewDidLayoutSubviews
{
    _headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    _tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}


@end
