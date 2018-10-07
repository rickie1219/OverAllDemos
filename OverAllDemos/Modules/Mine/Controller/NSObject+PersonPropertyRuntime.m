//
//  NSObject+PersonPropertyRuntime.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "NSObject+PersonPropertyRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (PersonPropertyRuntime)

const char * kPropertiesListKey = "XRPropertiesListKey";

+ (NSArray *)xr_objProperties {
    
    // --- 1.从 ‘关联对象‘ 中获取对象属性，如果有，就直接返回！
    /**
     获取关联对象 - 动态添加的属性
     
     参数：
     1. 对象 self
     2. 动态属性的 key
     
     返回值
     动态添加的 ‘属性值’
     */
    NSArray *ptyList = objc_getAssociatedObject(self, kPropertiesListKey);
    if (nil != ptyList) {
        return ptyList;
    }
    
    // 调用运行时方法，取得类的属性列表
    // Ivar 成员变量
    // Method 方法
    // Property 属性
    // Protocol 协议
    
    /**
     参数
     1. 要获取的类
     2. 类属性的个数指针
     
     返回值
     所有属性的数组， C 语言中，数组的名字，就是指向第一个元素的地址
     
     retain/create/copy 需要release， 最好 option+click 查看一下方法的解释说明
     */
    
    unsigned int count = 0;
    objc_property_t *proList = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性的数量 %d ", count);
    
    // 创建数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 遍历所有的属性
    for (unsigned int i = 0; i < count; i++) {
        // 1. 从数组中取得属性
        /**
         C 语言中的结构体指针，通常不需要 '*'
         */
        
        objc_property_t pty = proList[i];
        
        // 2. 从 pty 中获得属性的名称
        const char *cName = property_getName(pty);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", name);
        
        // 3.属性名称添加到数组中
        [arrayM addObject:name];
        
    }
    
    // 释放数组
    free(proList);
    
    // --- 2.到此为止，对象的属性数组已经获取完毕，利用关联对象，动态添加属性
    /**
     参数：
     1. 对象 self [OC 中 class 也是一个特殊的对象]
     2. 动态添加属性的 key，获取值的时候使用
     3. 动态添加的属性值
     4. 对象的引用关系
     */
    objc_setAssociatedObject(self, kPropertiesListKey, arrayM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrayM.copy;
}


// 所有字典转模型框架，核心算法!
+ (instancetype)xr_objWithDictionary:(NSDictionary *)dict {
    // 实例化对象
    id object = [[self alloc] init];
    
    // 使用字典，设置对象信息
    // 1> 获得 self 的属性列表
    NSArray *proList = [self xr_objProperties];
    
    // 2> 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"key: %@ ---- value: %@", key, obj);
        
        // 3> 判断 key 是否在 proList 中
        if ([proList containsObject:key]) {
            // 说明属性存在，可以使用 KVC 设置数值
            [object setValue:obj forKey:key];
        }
    }];
    
    return object;
}


/**
 在字典转模型框架中，如果字典嵌套层次结构非常深，框架由于利用递归实现转换，内存消耗大，执行性能不好。
 YY_Model 因为功能简单，所以速度快！
 */

@end
