//
//  TestLoopViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/7/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLoopViewVC.h"

#import "TestLoopViewCollectionView.h"

// 类扩展/匿名分类， 定义私有属性、方法
@interface TestLoopViewVC ()
{
    NSArray <NSURL *> *urls;
}
@end

@implementation TestLoopViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadData];
    
    
    TestLoopViewCollectionView *loopView = [[TestLoopViewCollectionView alloc] initWithURLs:urls];
    loopView.frame = CGRectMake(20, 100, self.view.frame.size.width - 20*2, 400);
    [self.view addSubview:loopView];
    
    
}

- (void)loadData
{
    NSMutableArray *arrTemp = [NSMutableArray array];
    
    for (int i = 0; i < 9; i++) {
        NSString *strFileName = [NSString stringWithFormat:@"1%02d@2x.jpeg", (i + 1)];
        NSLog(@"%@", strFileName);
        NSURL *url = [[NSBundle mainBundle] URLForResource:strFileName withExtension:nil];
        [arrTemp addObject:url];
    }
    // 网络拿到数据以后，字典转模型
    urls = [arrTemp copy];
    
    NSLog(@"---- = %@", urls);
}


@end
