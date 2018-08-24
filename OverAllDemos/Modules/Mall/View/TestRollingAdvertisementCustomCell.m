//
//  TestRollingAdvertisementCustomCell.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/24.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestRollingAdvertisementCustomCell.h"

@implementation TestRollingAdvertisementCustomCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"-----TestRollingAdvertisementCustomCell.h initWithFrame");
    }
    return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    _lab0 = [[UILabel alloc] init];
    _lab0.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_lab0];
    
    _lab1 = [[UILabel alloc] init];
    _lab1.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_lab1];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    _lab0.frame = CGRectMake(margin, 0, selfWidth - margin * 2, selfHeight/2);
    
    _lab1.frame = CGRectMake(CGRectGetMinX(_lab0.frame), CGRectGetMaxY(_lab0.frame), _lab0.frame.size.width, _lab0.frame.size.height);
    
}


@end
