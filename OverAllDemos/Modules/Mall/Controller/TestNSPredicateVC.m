//
//  TestNSPredicateVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/16.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestNSPredicateVC.h"
#import "TestNSPredicatePerson.h"

@interface TestNSPredicateVC ()

@end

@implementation TestNSPredicateVC

/**
 测试 NSPredicate （谓词） 的使用
 NSPredicate可以实现模糊搜索的功能，如果一个数组中装的全是人物名称，需要搜索出这个数组中名称中包含“梁”的所有人物名称，那么我们就可以使用NSPredicate来实现。当前了我们也可以直接遍历这个数组然后找到符合我们要求的所有数据，只不过使用NSPredicate实现会更加优雅。
 
 作者：梁森森
 链接：https://www.jianshu.com/p/c87c11e367a8
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 制造单一元素
    TestNSPredicatePerson * p1 = [[TestNSPredicatePerson alloc] init];
    p1.name = @"1";
    p1.age = 31;
    
    // 制作数组元素
    NSMutableArray * personArr = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i ++) {
        TestNSPredicatePerson * p = [[TestNSPredicatePerson alloc] init];
        if (i % 3 == 0) {
            p.name = [NSString stringWithFormat:@"人物：%lu", i];
        } else {
            p.name = [NSString stringWithFormat:@"大虾：%lu", i];
        }
        
        p.age = i +20;
        [personArr addObject:p];
    }
    
    // 1.谓词，过滤条件，筛选年龄大于25的人
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > 25"];
    [self validateObject:p1 isUpToTheStandardWithPredicate:predicate];
    
    // 2.数组中人物名字包含人物的元素
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS '人物'"];
    [self validateObjects:personArr isUpToTheStandardWithPredicate:namePredicate];
    
    // 3.模糊搜索数组中是否包含某个元素
    NSArray *names = @[@"Zhao", @"Qian", @"Sun", @"Li"];
    // 过滤所有包含n的名字
    NSPredicate *containPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS 'n'"];
    [self validateObjects:names isUpToTheStandardWithBlurPredicate:containPredicate];
    
    // 4.求两个数组的交集
    NSArray * arr1 = @[@(1), @(2), @(3), @(4)];
    NSArray * arr2 = @[@(3), @(4), @(5), @(6)];
    [self validateBaseObjects:arr1 hasIntersectionWithTargetObjects:arr2];
    
}


#pragma mark - 1.查看某个对象是否符合我们的要求
- (void)validateObject:(id)obj isUpToTheStandardWithPredicate:(NSPredicate *)predicate
{
    NSLog(@"----------------------------");
    // 判断筛选的对象是否是一个数组类型
    if ([obj isKindOfClass:[NSArray class]]) {
        NSLog(@"%@", [(NSArray *)obj filteredArrayUsingPredicate:predicate]);
    } else {
        
    }
    // 单个对象（看p1的age是否大于25）
    NSLog(@"%d", [predicate evaluateWithObject:obj]);
}

#pragma mark - 2.过滤数组
- (void)validateObjects:(NSArray *)objArr isUpToTheStandardWithPredicate:(NSPredicate *)namePredicate
{
    // 过滤数组，数组中人物年龄大于25的元素，筛选出来给results
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > 25"];
    NSArray *results = [objArr filteredArrayUsingPredicate:predicate];
    NSLog(@"%@", results);
    NSLog(@"%@", [results valueForKey:@"age"]);
    NSLog(@"%@", [objArr filteredArrayUsingPredicate:namePredicate]);
    
}

#pragma mark - 3.模糊搜索
- (void)validateObjects:(NSArray *)objArr isUpToTheStandardWithBlurPredicate:(NSPredicate *)blurPredicate
{
    // 模糊搜索
    NSLog(@"%@", [objArr filteredArrayUsingPredicate:blurPredicate]);
    
}

#pragma mark - 4.求两个数组的交集
- (void)validateBaseObjects:(NSArray *)baseObjtArr hasIntersectionWithTargetObjects:(NSArray *)targetObjtArr
{
    // 求两个数组的交集
    NSPredicate *arrPredicate = [NSPredicate predicateWithFormat:@"SELF in %@", targetObjtArr];
    NSLog(@"%@", [baseObjtArr filteredArrayUsingPredicate:arrPredicate]);

}

@end
