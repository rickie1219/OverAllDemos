//
//  NSObject+PersonPropertyRuntime.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 单行注释：在方法的地方按 Command+/
 
 标注的功能，快捷键是Command + Option + /
 
 需要在方法名的上面（空白）的地方按 Command + Option + /      才管用
 */

@interface NSObject (PersonPropertyRuntime)

/**
 获取类的属性列表数组

 @return 类的属性列表数组
 */
+ (NSArray *)xr_objProperties;



/**
 给定一个字典，创建 self 类对应的对象

 @param dict 字典
 @return 对象
 */
+ (instancetype)xr_objWithDictionary:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
