//
//  Person+TestRuntimeProperty.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/15.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "Person+TestRuntimeProperty.h"


@implementation Person (TestRuntimeProperty)

/// 定义关联的key
static const char *key = "hobby";

- (NSString *)hobby
{
    // 根据关联的key，获取关联的值
    return objc_getAssociatedObject(self, key);
}

- (void)setHobby:(NSString *)hobby
{
    // 第一个参数
    // 第二个参数
    // 第三个参数
    // 第四个参数
    
    objc_setAssociatedObject(self, key, hobby, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
