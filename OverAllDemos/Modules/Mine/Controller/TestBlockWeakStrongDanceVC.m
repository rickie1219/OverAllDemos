//
//  TestBlockWeakStrongDanceVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/7.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestBlockWeakStrongDanceVC.h"
#import "Person.h"

@interface TestBlockWeakStrongDanceVC ()

@property (nonatomic, copy) void (^demoBlock)();

@end

@implementation TestBlockWeakStrongDanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // weak-strong dance
    // 1. 定义block
    // 面试题：开发中是否碰到过循环引用，不要说没有！！
    __weak typeof(self) weakSelf = self;
    self.demoBlock = ^{
        
        // 0. OC 中定义变量，默认就是strong
        TestBlockWeakStrongDanceVC *strongSelf = weakSelf;
        
        // 1. 之前版本，会正常输出！
        NSLog(@"1.weakSelf -- %@", weakSelf.view);
        
        // 睡2s
        [NSThread sleepForTimeInterval:2.0];
        
        // 从 Xcode 7.3开始， 包括操作系统！
        // 就不需要强弱引用
        // 2.之前版本，会输出nil
        NSLog(@"2.weakSelf -- %@", weakSelf.view);
    };
    
    
    // 2. 执行 block
    dispatch_async(dispatch_get_main_queue(), ^{
        self.demoBlock();
    });
    
    [self testFunctionAndChainProgramming];
    [self testMasonry];
}

- (void)dealloc {
    NSLog(@"--------- %s", __FUNCTION__);
}



- (void)testMasonry {
    // Masonry 经典的链式函数式编程
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor blueColor];
    [self.view addSubview:v];
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        // 1. 函数式编程:
        // equalTo(self.view)
        // offSet(40)
        // 2. 链式编程
        // equalTo(self.view).offset(40);
        make.top.equalTo(self.view).offset(40);
        make.size.mas_offset(CGSizeMake(100, 100));
        make.centerX.equalTo(self.view).offset(-40);
    }];
}

- (void)testFunctionAndChainProgramming {
    
    Person *person = [Person new];
    
    // 1. 传统的写法：
    // 1> run 和 eat 需要单独调用！
    // 2> 不能随意组合顺序！
    [person run];
    [person eat];
    
    // 2. 目标1：链式编程！
    // 解决办法： run1/eat1 方法执行完毕之后，需要返回 Person 对象
    id obj1 = [person run1];
    [obj1 eat1];
    
    id obj2 = [person eat1];
    [obj2 run1];
    
    NSLog(@"----------------");
    [[person run1] eat1];
    [[person eat1] run1];
    
    
    // 3. 目标2：函数式编程！
    // 思考， 在 OC 中什么时候会用到 '()' -> 执行 block 需要 ()
    // person.run2().eat2();
    // person.eat2().run2();
    
    NSLog(@"--------需求--------");
    // 需求
    //person.run2() => person.eat2();
    person.run2().run2().eat2().run2();
    
    
    NSLog(@"----------------");
    person.run3(1000).eat3(@"water").run3(2000).eat3(@"wind");
}



@end
