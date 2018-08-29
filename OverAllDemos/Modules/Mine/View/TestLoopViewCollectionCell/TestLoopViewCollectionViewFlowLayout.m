//
//  TestLoopViewCollectionViewFlowLayout.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/30.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLoopViewCollectionViewFlowLayout.h"

@implementation TestLoopViewCollectionViewFlowLayout

// 在 collectionView 的第一次布局的时候，被调用，此时 collectionView 的frame已经设置完毕
- (void)prepareLayout
{
    // 一定要重写父类的prepareLayout方法
    [super prepareLayout];
    
    NSLog(@"%@", self.collectionView);
    // 直接利用 collectionView 的属性设置布局
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
