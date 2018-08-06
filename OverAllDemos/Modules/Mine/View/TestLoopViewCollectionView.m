//
//  TestLoopViewCollectionView.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/7/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLoopViewCollectionView.h"



@implementation TestLoopViewCollectionView
{
    NSArray <NSURL *> *_urls;
}


- (instancetype)initWithURLs:(NSArray <NSURL *> *)urls
{
    /*注意点： 一定要使用UICollectionViewFlowLayout 流式布局*/
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256/255.0) green:arc4random_uniform(256/255.0) blue:arc4random_uniform(256/255.0) alpha:arc4random_uniform(256/255.0)];
    }
    return self;
}

@end
