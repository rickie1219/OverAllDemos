//
//  MenuTitleLabel.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/1/23.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MenuTitleLabel.h"

@implementation MenuTitleLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:18];
        self.font = [UIFont fontWithName:@"HYQiHei" size:19];
        self.scale = 0.0;
    }
    return self;
}

/** 通过scale的改变改变多种参数 */
- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1];
    
    CGFloat minScale = 0.7;
    CGFloat trueScale = minScale + (1 - minScale) * scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}



@end
