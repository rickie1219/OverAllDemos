//
//  TestRollingAdvertisementTextCell.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/24.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestRollingAdvertisementTextCell.h"


@interface TestRollingAdvertisementTextCell ()

@property (nonatomic, strong) UIButton *testBtn;

@end


@implementation TestRollingAdvertisementTextCell


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}


// cell 高度30
- (void)setupUI
{
    _testBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.contentView addSubview:_testBtn];
    _testBtn.backgroundColor = [UIColor whiteColor];
    
    _customLab = [[UILabel alloc] init];
    _customLab.textColor = [UIColor redColor];
    _customLab.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_customLab];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    
    
    _testBtn.frame = CGRectMake(10, (selfHeight - 20)/2, 20, 20);
    _customLab.frame = CGRectMake(CGRectGetMaxX(_testBtn.frame)+margin, (selfHeight - 30)/2, selfWidth - CGRectGetMaxX(_testBtn.frame)-margin-margin, 30);
}


@end
