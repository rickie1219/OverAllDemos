//
//  UIImageView+TestPersonObjVCImageView.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/7.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "UIImageView+TestPersonObjVCImageView.h"

/**
 AFN 363 行
 static inline void af_swizzleSelector(Class theClass, SEL originalSelector, SEL swizzledSelector) {
 Method originalMethod = class_getInstanceMethod(theClass, originalSelector);
 Method swizzledMethod = class_getInstanceMethod(theClass, swizzledSelector);
 method_exchangeImplementations(originalMethod, swizzledMethod);
 }
 */


@implementation UIImageView (TestPersonObjVCImageView)


/**
 在类被加载到运行时的时候，就会执行
 */
+ (void)load {
    // 1. 获取 UIImageView 类的 实例方法 ‘setImage:‘
    Method originalMethod = class_getInstanceMethod([self class], @selector(setImage:));
    // 2. 获取 UIImageView 类的 实例方法 ’cz_setImage:‘，本身定义在分类中
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(cz_setImage:));
    
    // 3. 交换方法 setImage 和 cz_setImage， 交换完成之后
    // 1> 调用setImage 相当于调用 cz_setImage
    // 2> 调用cz_setImage 相当于调用 setImage
    method_exchangeImplementations(originalMethod, swizzledMethod);
}


/**
 1. 当在其他位置调用 ’setImage:‘ 方法时，’自动‘调用 cz_setImage: 方法
 
 @param image 传进来的图片参数
 */
- (void)cz_setImage:(UIImage *)image {
    
    //NSLog(@"%s", __FUNCTION__);
    
    // 1. 根据 imageView 的大小，重新调整 image 的大小
    // 使用 ‘CG’ 重新生成一张和目标尺寸相同的图片
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    // 绘制图像
    [image drawInRect:self.bounds];
    
    // 取得结果
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    // 调用系统默认的 setImage 方法
    [self cz_setImage:image];
}


@end
