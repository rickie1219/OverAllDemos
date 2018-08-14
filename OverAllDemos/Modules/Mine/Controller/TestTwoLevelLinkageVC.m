//
//  TestTwoLevelLinkageVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/7.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestTwoLevelLinkageVC.h"
#import "FileManager.h"
#import "NSData+JSONData.h"
#import "ItemManagerModel.h"
#import "TwoLevelLinkageView.h"
#import "LeftSideCell.h"
#import "RightSideCell.h"
#import "RightSideHeaderView.h"
#import "UIColor+ForPublicUse.h"
#import "UIView+SetRect.h"

@interface TestTwoLevelLinkageVC () <TwoLevelLinkageViewDelegate>

@property (nonatomic, strong) ItemManagerModel *itemManagerModel;


@end

@implementation TestTwoLevelLinkageVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Init view.
    TwoLevelLinkageView *view = [[TwoLevelLinkageView alloc] initWithFrame:self.contentView.bounds leftSideWidth:100.f];
    view.delegate             = self;
    [self.contentView addSubview:view];
    
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(100.f, 0.f, 0.5f, view.height)];
    line.backgroundColor = [UIColor lineColor];
    [view addSubview:line];
    
    // Register cells & headers.
    [view registerCellsWithLeftSideTableView:^(UITableView *tableView) {
        
        [LeftSideCell registerToTableView:tableView];
        
    } registerCellsAndHeadersWithRightSideTableView:^(UITableView *tableView) {
        
        [RightSideCell       registerToTableView:tableView];
        [RightSideHeaderView registerToTableView:tableView];
    }];
    
    // Get data.
    view.models = [self models];
    
    // Reload data.
    [view reloadData];
    [view leftTableViewCellMakeSelectedAtRow:0];
}

- (NSArray <LinkageOneLevelModel *> *)models {
    
    // Get data.
    NSData *data          = [NSData dataWithContentsOfFile:[FileManager bundleFileWithName:@"liwushuo.json"]];
    self.itemManagerModel = [[ItemManagerModel alloc] initWithDictionary:[data toListProperty]];
    [self.itemManagerModel.data.categories removeObjectAtIndex:0];
    
    // Transform data.
    NSMutableArray <LinkageOneLevelModel *> *models = [NSMutableArray array];
    [self.itemManagerModel.data.categories enumerateObjectsUsingBlock:^(CategoryModel * categoryModel, NSUInteger idx, BOOL *stop) {
        
        NSMutableArray <LinkageTwoLevelModel *> *subModels = [NSMutableArray array];
        [categoryModel.subcategories enumerateObjectsUsingBlock:^(ShopItemModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
            
            // Create LinkageTwoLevelModel.
            LinkageTwoLevelModel *twoLevelModel = [LinkageTwoLevelModel new];
            twoLevelModel.adapter               = [RightSideCell fixedHeightTypeDataAdapterWithData:model];
            [subModels addObject:twoLevelModel];
        }];
        
        // Create LinkageOneLevelModel.
        LinkageOneLevelModel *model = [LinkageOneLevelModel new];
        model.subModels             = subModels;
        model.adapter               = [LeftSideCell fixedHeightTypeDataAdapterWithData:categoryModel];
        model.headerAdapter         = [RightSideHeaderView fixedHeightTypeDataAdapterWithData:categoryModel];;
        [models addObject:model];
    }];
    
    // Let the first item selected.
    models.firstObject.selected = YES;
    
    return models;
}

#pragma mark - TwoLevelLinkageViewDelegate

- (void)twoLevelLinkageView:(TwoLevelLinkageView *)linkageView selectedLeftSideTableViewItemRow:(NSInteger)row item:(id)data {
    
    NSLog(@"------ selected=LeftSide=TableViewItemRow = %@; row = %ld", data, row);
}

- (void)twoLevelLinkageView:(TwoLevelLinkageView *)linkageView selectedRightSideTableViewItemIndexPath:(NSIndexPath *)indexPath item:(id)data {
    
    NSLog(@"------ selected>>RightSide<<TableViewItem = %@; indexPath.section = %ld indexPath.row = %ld", data, indexPath.section, indexPath.row);
}







@end