//
//  MineViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MineViewController.h"

#import "TestNSUserDefaultsVC.h"
#import "TestRandomNumberVC.h"
#import "TestHeaderImageScaleViewController.h"
#import "TestFaceBookPopViewController.h"
#import "TestBase64HashCodeViewController.h"
#import "TestTextfieldViewController.h"
#import "TestEmotionViewController.h"
#import "TestKVOReceiveValueViewController.h"
#import "TestGCDViewController.h"
#import "TestMVVMViewController.h"
#import "TestGestureViewController.h"
#import "TestPickerViewVC.h"
#import "TestLoopViewVC.h"
#import "TestDatabaseVC.h"
#import "TestMyStaticLibraryVC.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *m_tableView;
    NSArray *arrTestVCs;
}


@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 判断如果是iOS 11就设置大标题
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;
    } else {
        // Fallback on earlier versions
    }
    
    arrTestVCs = @[
                   @{
                       @"className" : @"TestNSUserDefaultsVC",
                       @"title"     : @"测试NSUserDefaults"
                       },
                   @{
                       @"className" : @"TestRandomNumberVC",
                       @"title"     : @"测试随机数"
                       },
                   @{
                       @"className" : @"TestHeaderImageScaleViewController",
                       @"title"     : @"测试头部图片拉伸"
                       },
                   @{
                       @"className" : @"TestFaceBookPopViewController",
                       @"title"     : @"测试Facebook的POP动画效果"
                       },
                   @{
                       @"className" : @"TestBase64HashCodeViewController",
                       @"title"     : @"测试HM的Base64和Hash加密解密"
                       },
                   @{
                       @"className" : @"TestTextfieldViewController",
                       @"title"     : @"测试Textfield"
                       },
                   @{
                       @"className" : @"TestEmotionViewController",
                       @"title"     : @"测试自定义表情键盘"
                       },
                   @{
                       @"className" : @"TestKVOReceiveValueViewController",
                       @"title"     : @"测试KVO传值"
                       },
                   @{
                       @"className" : @"TestGCDViewController",
                       @"title"     : @"测试多线程之间的依赖关系"
                       },
                   @{
                       @"className" : @"TestMVVMViewController",
                       @"title"     : @"测试MVVM模型"
                       },
                   @{
                       @"className" : @"TestGestureViewController",
                       @"title"     : @"测试手势"
                       },
                   @{
                       @"className" : @"TestPickerViewVC",
                       @"title"     : @"测试点餐工具选择器"
                       },
                   @{
                       @"className" : @"TestLoopViewVC",
                       @"title"     : @"测试CollectionView轮播器"
                       },
                   @{
                       @"className" : @"TestDatabaseVC",
                       @"title"     : @"测试本地持久化存储DataBase"
                       },
                   @{
                       @"className" : @"TestMyStaticLibraryVC",
                       @"title"     : @"测试打包静态库.a文件,访问.a文件中的方法"
                       }
                   ];
    
    
    
    
    
    m_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49-64-40) style:UITableViewStylePlain];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    m_tableView.rowHeight = 60;
    m_tableView.tableFooterView = [UIView new];
    // 一种不错的浅灰色颜色
    m_tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld. = %@", (long)indexPath.row, arrTestVCs[indexPath.row] [@"className"]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseViewController *vc = [NSClassFromString(arrTestVCs[indexPath.row] [@"className"]) new];
    // 如果是首页和分类，导航栏标题就为空
    vc.title = [NSString stringWithFormat:@"%@", arrTestVCs[indexPath.row] [@"title"]];
    //vc.navigationItem.prompt = [NSString stringWithFormat:@"%@", arrTestVCs[indexPath.row] [@"className"]];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
