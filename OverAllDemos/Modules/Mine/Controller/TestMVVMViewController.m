//
//  TestMVVMViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/19.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestMVVMViewController.h"
#import "PersonListViewModel.h"

@interface TestMVVMViewController ()
{
    PersonListViewModel *personViewModel;
}

@end

@implementation TestMVVMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 加载数据
    [self loadData];
    
    // 测试链式编程
    Person *person = [[Person alloc] init];
    [[[[person run] eat] run] eat];
    
    // 测试函数式编程
    person.runBlock().eatBlock().runBlock().eatBlock();
    person.runBlockParamerter(400).eatBlockParameter(@"water").runBlockParamerter(1000).eatBlockParameter(@"apple");
    
}

- (void)loadData {
    
    // 创建模型，加载数据
    personViewModel = [[PersonListViewModel alloc] init];
    
    [personViewModel loadPerson];
    
}

@end
