//
//  TestLargeTitleShowVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/9.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLargeTitleShowVC.h"
#import "TestPickerViewVC.h"

@interface TestLargeTitleShowVC ()<UISearchResultsUpdating, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, UITabBarControllerDelegate>
{
    UITableView *tableView;
    NSInteger numOfRows;
    UITabBarItem *favoriteTabBar;
    UISearchController *searchController;
}

@end

@implementation TestLargeTitleShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取单元行数
    numOfRows = 35;
    
    [self initTableView];
    //[self setupSearchController];
    
}

- (void)initTableView
{
    CGFloat navH = 44;
    
//    if (@available(iOS 11.0, *)) {
//        if (YES == self.navigationController.navigationBar.prefersLargeTitles) {
//            navH = navH + 52;
//        } else {
//            navH = navH;
//        }
//    } else {
//
//    }
    
    if (812 == [UIScreen mainScreen].bounds.size.height) {
        navH = navH + 44;
    } else {
        navH = navH + 20;
    }
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - navH) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    } else {
        // Fallback on earlier versions
    }
}

- (void)setupSearchController
{
    if (@available(iOS 11.0, *)) {
        searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
        searchController.searchResultsUpdater = self;
        searchController.dimsBackgroundDuringPresentation = NO;
        self.definesPresentationContext = YES;
        searchController.searchBar.delegate = self;
        searchController.hidesNavigationBarDuringPresentation = NO;
        self.navigationItem.searchController = searchController;
        self.navigationItem.hidesSearchBarWhenScrolling = YES;
    } else {
        // Fallback on earlier versions
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"00 - Scroll View New!";
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"01 - Safe Area New!";
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld - Hello!", indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return numOfRows;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"---0000");
        TestPickerViewVC *vc = [[TestPickerViewVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        NSLog(@"---1111");
    } else {
        NSLog(@"---2222");
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDelegate new methods
- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
API_AVAILABLE(ios(11.0))
{
    UISwipeActionsConfiguration *swipeConfig = [UISwipeActionsConfiguration configurationWithActions:@[[self deleteActionForRowAtIndexPath:indexPath]]];
    return swipeConfig;
}

- (UIContextualAction *)deleteActionForRowAtIndexPath:(NSIndexPath *)indexPath
API_AVAILABLE(ios(11.0))
{
    UIContextualAction *action = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        numOfRows -= 1;
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        completionHandler(YES);
    }];
    return action;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
API_AVAILABLE(ios(11.0))
{
    UISwipeActionsConfiguration *swipeConfig = [UISwipeActionsConfiguration configurationWithActions:@[[self deleteActionForRowAtIndexPath:indexPath]]];
    return swipeConfig;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
}

@end
