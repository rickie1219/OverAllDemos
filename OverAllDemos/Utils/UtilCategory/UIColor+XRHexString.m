//
//  UIColor+XRHexString.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/4.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "UIColor+XRHexString.h"

@implementation UIColor (XRHexString)


/// 根据无符号的32位整数转换成对应的 rgb 颜色， 0xFF0000
+ (instancetype)xr_colorWithHexString:(u_int32_t)hexString {
    
    // 0xFFAA99
    int red = (hexString & 0xFF0000) >> 16;
    
    // 0xFFAA99
    // 0x00FF00
    // => 0x00AA00   C语言中使用位运算 将后面的两个00值去掉，即向左移8位  => 0x0000AA
    int green = (hexString & 0x00FF00) >> 8;
    
    // 0xFFAA99      0xFFAA 1001 1001     0x1111 1111 AA 1001 1001      99=1001 1001
    // 0x0000FF      0X0000 1111 1111     0x0000 0000 00 1111 1111      FF=1111 1111
    // 按位与的运算
    int blue = hexString & 0x0000FF;
    
    return [UIColor colorWithRed: red / 255.0 green: green / 255.0 blue: blue / 255.0 alpha: 1.0];
    
}




@end
