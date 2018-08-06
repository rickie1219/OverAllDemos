//
//  TestDatabaseVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/1.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestDatabaseVC.h"

@interface TestDatabaseVC ()

@end

@implementation TestDatabaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    /**
     第一个常量NSDocumentDirectory表示正在查找沙盒Document目录的路径（如果参数为NSCachesDirectory则表示沙盒Cache目录）
     第二个常量NSUserDomainMask表明我们希望将搜索限制在应用的沙盒内
     */
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    /**因为每一个应用只有一个Documents目录，所以这里取第一个和最后一个数据都是一样的*/
    NSString *documentFilePath = paths.firstObject;
    
    NSString *cacheFilePath = [self getCacheFilePath];
    
    
    NSLog(@"--- documentFilePath = %@", documentFilePath);
    
    NSLog(@"--- cacheFilePath = %@", cacheFilePath);
    
}

- (NSString *)getCacheFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return paths.firstObject;
}



@end
