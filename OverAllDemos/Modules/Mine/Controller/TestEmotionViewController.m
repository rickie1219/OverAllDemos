//
//  TestEmotionViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/13.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestEmotionViewController.h"
#import "EmotionsCollectionViewCell.h"
#import <QMUIKit/QMUIToastView.h>

#define kViewHeight 216
#define kToolbarHeight 37
#define kOneEmoticonHeight 50
#define kOnePageCount 20

#define kDotSelectedColor [UIColor redColor].CGColor
#define kDotUnSelectedColor [UIColor whiteColor].CGColor

@interface TestEmotionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *e_collectionView;
    NSArray *arrDatasource;
    UIView *pageControl;
    NSInteger currentPageIndex;
    
    
    CGFloat padding;
    
    // 计算每个item的宽度
    CGFloat itemWidth;
    CGFloat itemHeight;
    NSInteger dotPageNums;
    NSInteger curGroupPageIndex;
    NSMutableArray *arrDotLayers;
}

@end

@implementation TestEmotionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    currentPageIndex = NSNotFound;
    arrDatasource = @[
                      @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"],
                      @[@"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40"],
                      @[@"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", @"60"],
                      @[@"61", @"62", @"63", @"64", @"65", @"66", @"67", @"68", @"69", @"70", @"71", @"72", @"73", @"74", @"75", @"76", @"77", @"78", @"79", @"80"]
                      ];
    
    [self initCollectionView];
    
}


- (void)initCollectionView
{
    
    CGFloat heightColloction = 180;
    CGFloat widthColloction = kScreenWidth;
    // 间距
    padding = 10;
    
    // 计算每个item的宽度
    itemWidth = (widthColloction - padding *2) / 7;
    itemHeight = heightColloction / 3;
    
    NSLog(@"itemWidth = %.2f", itemWidth);
    NSLog(@"itemHeight = %.2f", itemHeight);
    
    // 设置流动布局
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    // 设置滚动方向为水平方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置单个item的大小，即一个表情的大小
    //layout.itemSize = CGSizeMake(itemWidth, itemHeight);
    layout.headerReferenceSize = CGSizeMake(0, 0);
    // 设置最小行间距为0
    layout.minimumLineSpacing = 0;
    // 设置最小item之间的间距为0
    layout.minimumInteritemSpacing = 0;
    // 设置分区的内边距，top：0，left：左边距，bottom：0，right：右边距
    layout.sectionInset = UIEdgeInsetsMake(0, padding, 0, padding);
    
    // 创建表情的集合视图
    e_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 250, widthColloction, heightColloction) collectionViewLayout:layout];
    [e_collectionView registerClass:[EmotionsCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    e_collectionView.delegate = self;
    e_collectionView.dataSource = self;
    e_collectionView.pagingEnabled = YES;
    e_collectionView.backgroundColor = [UIColor whiteColor];
    e_collectionView.showsVerticalScrollIndicator = NO;
    e_collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:e_collectionView];
    
    // 创建页面控制器，自定义的pageControl
    pageControl = [UIView new];
    pageControl.frame = CGRectMake(0, CGRectGetMaxY(e_collectionView.frame)+5, kScreenWidth, 20);
    pageControl.backgroundColor = [UIColor blackColor];
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    
    [self initDotView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return arrDatasource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [arrDatasource[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EmotionsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.lblTitle.text = [NSString stringWithFormat:@"%@", arrDatasource[indexPath.section][indexPath.row]];
    cell.lblCellFag.text = [NSString stringWithFormat:@"%ld.%ld", indexPath.section, indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(itemWidth, itemHeight);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strSelectedItem = [NSString stringWithFormat:@"indexPath.section = %ld, indexPath.row = %ld", indexPath.section, indexPath.row];
    // 显示一个提示，选中的是第几个
    UIView *parentView = self.navigationController.view;
    [QMUITips showInfo:@"选中的是第几个Item" detailText:strSelectedItem inView:parentView hideAfterDelay:2];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 计算分页个数
    dotPageNums = round(scrollView.contentOffset.x / scrollView.frame.size.width);
    // 如果分页个数小于0，那也赋值为0
    if (dotPageNums < 0) dotPageNums = 0;
    // 如果
    else if (dotPageNums >= arrDatasource.count) dotPageNums = arrDatasource.count - 1;
    if (dotPageNums == currentPageIndex) return;
    currentPageIndex = dotPageNums;
    
    for (int i = 0; i < arrDatasource.count; i++) {
        CALayer *layer = arrDotLayers[i];
        if (dotPageNums - curGroupPageIndex == i) {
            // 当前页的指示器dot点设置为白色
            layer.backgroundColor = kDotSelectedColor;
        } else {
            // 其他页的未选中的指示器dot点设置为橘黄色
            layer.backgroundColor = kDotUnSelectedColor;
        }
    }
    
}

#pragma mark - 初始化分页指示器dot点的视图
- (void)initDotView
{
    NSInteger curGroupPageCount = 0;
    
    // 根据分区个数创建相应的dot点的个数，存放到dot点数组中
    arrDotLayers = [NSMutableArray array];
    for (int i = 0; i < arrDatasource.count; i++) {
        CALayer *layer = [CALayer layer];
        // 将layer添加到数组中
        [arrDotLayers addObject:layer];
        // 将创建的layer添加到分页指示器视图的layer上
        [pageControl.layer addSublayer:layer];
    }
    
    // 初始化为0
    dotPageNums = 0;
    // 初始化当前dot点指示器的索引为第一个，即为0；
    curGroupPageIndex = 0;
    // 当前分页总数
    curGroupPageCount = arrDatasource.count;
    
    // 设置dot点的frame： 左右间距为5， 宽度为6，高度为2
    CGFloat padding = 5, width = 10, height = 3;
    // 设置分页指示器的宽度 = （padding+width+padding）*分页总个数
    CGFloat pageControlWidth = (width + 2 * padding) * curGroupPageCount;
    // 循环创建dot点
    for (NSInteger i = 0; i < curGroupPageCount; i++) {
        CALayer *layer = arrDotLayers[i];
        // 设置每个dot点的横坐标x起始点
        CGFloat left = (pageControl.frame.size.width - pageControlWidth) / 2 + i * (width + 2 * padding) + padding;
        // 设置每个dot点的Frame， 横坐标x起始点，纵坐标y起始点
        layer.frame = CGRectMake(left, (pageControl.frame.size.height - height) / 2, width, height);
        // 设置半径为2，获得圆弧
        layer.cornerRadius = 1.5;
        // 如果计算偏移量得到的点的数字-当前页的索引=当前i的索引，那么就说明是当前显示的页面
        if (dotPageNums - curGroupPageIndex == i) {
            // 当前页的指示器dot点设置为白色
            layer.backgroundColor = kDotSelectedColor;
        } else {
            // 其他页的未选中的指示器dot点设置为橘黄色
            layer.backgroundColor = kDotUnSelectedColor;
        }
    }
}



@end
