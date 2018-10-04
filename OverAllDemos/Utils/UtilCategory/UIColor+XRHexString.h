//
//  UIColor+XRHexString.h
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/4.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XRHexString)

/// 根据无符号的32位整数转换成对应的 rgb 颜色， 0xFF0000
/// @param hexString hex
/// @return UIColor
+ (instancetype)xr_colorWithHexString:(u_int32_t)hexString;

@end

NS_ASSUME_NONNULL_END
