//
//  RequesCover.m
//  YZDisplayViewControllerDemo
//
//  Created by yz on 15/12/21.
//  Copyright © 2015年 yz. All rights reserved.
//

#import "RequesCover.h"

@interface RequesCover ()

@property (strong, nonatomic) UIImageView *animView;



@end

@implementation RequesCover


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lblTip = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - 300)/2, (self.frame.size.height - 60)/2, 300, 60)];
        lblTip.text = @"正在加载中ing......";
        lblTip.textAlignment = NSTextAlignmentCenter;
        lblTip.backgroundColor = [UIColor redColor];
        [self addSubview:lblTip];
    }
    return self;
}

+ (instancetype)requestCover
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)initRequestCoverWithFrame:(CGRect)frame
{
    
    
    return [[UIView alloc] init];
}


- (void)awakeFromNib
{
//    NSMutableArray *images = [NSMutableArray array];
//    for (int i = 1; i <= 10; i++) {
//        NSString *imageName = [NSString stringWithFormat:@"%d",i];
//        UIImage *image = [UIImage imageNamed:imageName];
//        [images addObject:image];
//    }
//    
//    _animView.animationRepeatCount = MAXFLOAT;
//    _animView.animationImages = images;
//    _animView.animationDuration = 1;
//    [_animView startAnimating];
}

@end
