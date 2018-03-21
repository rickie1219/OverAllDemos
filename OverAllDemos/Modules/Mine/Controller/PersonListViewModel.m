//
//  PersonListViewModel.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/19.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "PersonListViewModel.h"


@implementation PersonListViewModel

- (void)loadPerson
{
    NSLog(@"%s", __FUNCTION__);
    
    _personList = [NSMutableArray array];
    
    // 这里实现数据加载
    // 模拟异步加载数据
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        // 模拟延时
        [NSThread sleepForTimeInterval:2];
        
        // 创建数组
        for (int i = 0; i < 20; i++) {
            Person *person = [[Person alloc] init];
            
            person.name = [@"Zhangsan" stringByAppendingFormat:@"%zd", i];
            
            person.age = 15 + arc4random_uniform(20);
            
            [_personList addObject:person];
        }
        
        NSLog(@"%@", _personList);
    });
}

@end
