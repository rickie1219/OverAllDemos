//
//  TestLoopViewCollectionView.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/7/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLoopViewCollectionView.h"
#import "TestLoopViewCollectionViewFlowLayout.h"
#import "TestLoopViewCell.h"

NSString *const CZLoopViewCellId = @"CZLoopViewCellId";

@interface TestLoopViewCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

/** ‘独立’的处理轮播器相关的所有代码逻辑*/
@implementation TestLoopViewCollectionView
{
    // 定义一个泛型的url数组变量
    NSArray <NSURL *> *_urls;
}


/** 在这里接收从外面传递过来的urls，并存储给成员变量 _urls 数组*/
- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls
{
    /*注意点： 一定要使用UICollectionViewFlowLayout 流式布局*/
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[TestLoopViewCollectionViewFlowLayout alloc] init]];
    if (self) {
        // 获取从外部传进来的urls数组数据源，存储到本地的成员变量 _urls 中
        _urls = urls;
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256/255.0) green:arc4random_uniform(256/255.0) blue:arc4random_uniform(256/255.0) alpha:arc4random_uniform(256/255.0)];
        self.dataSource = self;
        
        [self registerClass:[TestLoopViewCell class] forCellWithReuseIdentifier:CZLoopViewCellId];
        
    }
    return self;
}


#pragma mark - 实现 collectionView 的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _urls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CZLoopViewCellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:arc4random_uniform(256)/255.0];
    
    cell.url = _urls[indexPath.item];
    
    return cell;
}


@end
