//
//  Person.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) NSInteger age;

/// title
@property (nonatomic, copy) NSString *title;

/// 身高
@property (nonatomic, assign) double height;

/// 链式编程
/// 动作行为1：跑
- (Person *)run;

/// 动作行为2：吃
- (Person *)eat;

/// 动作行为1：跑1
- (Person *)run1;

/// 动作行为2：吃1
- (Person *)eat1;


// 关于链式编程和函数式编程
// 1. 自己封装框架！
// 2. 阅读其他人的框架!
// 如果要实现函数式编程，需要返回 block
- (Person * (^)())run2;
- (Person * (^)())eat2;

// 返回的 block 可以接参数
- (Person * (^)(NSString *food))eat3;
- (Person * (^)(double distance))run3;


/// 函数式编程
/// 有返回值，但无参的block函数
- (Person * (^)())runBlock;
- (Person * (^)())eatBlock;

/// 有返回值，有参数的block函数
- (Person * (^)(double distance))runBlockParamerter;
- (Person * (^)(NSString *food))eatBlockParameter;


@end
