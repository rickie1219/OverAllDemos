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

/** 这是构造函数*/
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
        self.delegate = self;
        
        [self registerClass:[TestLoopViewCell class] forCellWithReuseIdentifier:CZLoopViewCellId];
        
        
        // 初始化显示第二组 [0, 1, 2] [3, 4, 5]
        // 开发中，什么时候用过多线程，不要和我说 AFN！
        // 主队列
        // 1.安排任务在主线程上执行
        // 2.如果主线程当前有任务要执行，主队列暂时不调度任务
        // 利用 dispatch_async 在主队列中异步，保证数据源方法执行完毕后，再滚动 collectionView
        // 提示：公司的项目中可能会在 viewDidLoad 方法中使用大量的主队列异步！
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_urls.count inSection:0];
            // 滚动位置
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

        });
        
    }
    return self;
}


#pragma mark - 实现 collectionView 的数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _urls.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CZLoopViewCellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:arc4random_uniform(256)/255.0];
    
    // 取个模
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
}

#pragma mark - 实现 collectionView 的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    // 1. 获取当前停止的页面
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    NSLog(@"%zd", offset);
    
    // 2. 第0页， 跳转到， 第1组的第0页
    // 最后一页， 跳转到第0组的最后一页
    
    if (offset == 0 || offset == ([self numberOfItemsInSection:0] - 1)) {
        NSLog(@"---- %zd", offset);
        
        
        // 最后一页
        if (0 == offset) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        
        // 重新调整 contentOffset
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}


@end
