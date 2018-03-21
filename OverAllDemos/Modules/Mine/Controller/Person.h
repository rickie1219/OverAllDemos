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


/// 链式编程
/// 动作行为1：跑
- (Person *)run;

/// 动作行为2：吃
- (Person *)eat;


/// 函数式编程
/// 有返回值，但无参的block函数
- (Person * (^)())runBlock;
- (Person * (^)())eatBlock;

/// 有返回值，有参数的block函数
- (Person * (^)(double distance))runBlockParamerter;
- (Person * (^)(NSString *food))eatBlockParameter;


@end
