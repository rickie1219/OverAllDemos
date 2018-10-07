//
//  Person.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "Person.h"

/**
 用到Person类的控制器
 #import "TestMVVMViewController.h"
 #import "TestKVOReceiveValueViewController.h"
 */


@implementation Person

- (NSString *)description
{
    NSArray *keys = @[@"name", @"age", @"title", @"height"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}

- (NSString *)debugDescription
{
    NSArray *keys = @[@"name", @"age"];
    return [NSString stringWithFormat:@"<class:%@ isa:%p\n keys and values:%@", [self class], self, [self dictionaryWithValuesForKeys:keys].description];
}


- (Person *)run
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"run....");
    return self;
}

- (Person *)eat
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"eat....");
    return self;
}

- (Person *)run1
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"run1....");
    return self;
}

- (Person *)eat1
{
    NSLog(@"%s", __FUNCTION__);
    NSLog(@"eat1....");
    return self;
}

- (Person * (^)())run2 {
    NSLog(@"%s", __FUNCTION__);
    Person * (^runBlock)() = ^ {
        NSLog(@"run2");
        return self;
    };
    return runBlock;
}

- (Person *(^)())eat2 {
    
    return ^ {
        NSLog(@"吃");
        return self;
    };
}


- (Person *(^)(NSString *))eat3 {
    
    return ^ (NSString *food){
        
        NSLog(@"吃 -- %@", food);
        
        return self;
    };
}

- (Person *(^)(double))run3 {
    return ^ (double distance){
        NSLog(@"跑 -- %.2f", distance);
        
        return self;
    };
}



- (Person *(^)())runBlock
{
    return ^ {
        NSLog(@"runBlock....");
        return self;
    };
}

- (Person *(^)())eatBlock
{
    return ^ {
        NSLog(@"eatBlock.....");
        return self;
    };
}

- (Person *(^)(NSString *))eatBlockParameter
{
    return ^ (NSString *food) {
        NSLog(@"eat food .... %@", food);
        return self;
    };
}

- (Person *(^)(double))runBlockParamerter
{
    return ^ (double distance) {
        NSLog(@"run distance .... %.2f", distance);
        return self;
    };
}

- (Person * (^)(void))run22 {
    Person * (^runblock)(void) = ^ {
        NSLog(@"run2");
        return self;
    };
    
    return runblock;
}

@end
