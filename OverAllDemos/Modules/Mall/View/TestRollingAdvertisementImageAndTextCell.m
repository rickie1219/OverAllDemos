//
//  TestRollingAdvertisementImageAndTextCell.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/24.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestRollingAdvertisementImageAndTextCell.h"


@implementation TestRollingAdvertisementImageAndTextCell
{
    UIImageView *_logoIconImgView;
    
    UILabel *_tagLab0;
    UILabel *_titleLab0;
    
    UILabel *_tagLab1;
    UILabel *_titleLab1;
    
    UIImageView *_showImgView;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat selfWidth = self.frame.size.width;
    CGFloat selfHeight = self.frame.size.height;
    CGFloat iconWidth = selfHeight;
    CGFloat showImgWidth = 80;
    CGFloat tagWidth = 50;
    CGFloat tagHeight = selfHeight/2;
    CGFloat titleWidth = selfWidth - margin - iconWidth - margin - margin - showImgWidth - margin;
    
    _logoIconImgView.frame = CGRectMake(0, 0, iconWidth, selfHeight);
    
    _tagLab0.frame = CGRectMake(CGRectGetMaxX(_logoIconImgView.frame), CGRectGetMinY(_logoIconImgView.frame), tagWidth, tagHeight);
    
    _titleLab0.frame = CGRectMake(CGRectGetMaxX(_tagLab0.frame), CGRectGetMinY(_tagLab0.frame), titleWidth, _tagLab0.frame.size.height);
    
    _tagLab1.frame = CGRectMake(CGRectGetMinX(_tagLab0.frame), CGRectGetMaxY(_tagLab0.frame), tagWidth, _tagLab0.frame.size.height);
    
    _titleLab1.frame = CGRectMake(CGRectGetMaxX(_tagLab1.frame), CGRectGetMinY(_tagLab1.frame), titleWidth, _tagLab1.frame.size.height);
    
    _showImgView.frame = CGRectMake(CGRectGetMaxX(_titleLab0.frame), 0, showImgWidth, _logoIconImgView.frame.size.height);
}


- (void)setupUI
{
    _logoIconImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tb_icon1"]];
    _logoIconImgView.contentMode = UIViewContentModeScaleAspectFit;
    _logoIconImgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_logoIconImgView];
    
    _tagLab0 = [[UILabel alloc] init];
    _tagLab0.backgroundColor = [UIColor cyanColor];
    _tagLab0.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_tagLab0];
    
    
    _titleLab0 = [[UILabel alloc] init];
    _titleLab0.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLab0];
    
    _tagLab1 = [[UILabel alloc] init];
    _tagLab1.backgroundColor = [UIColor redColor];
    _tagLab1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_tagLab1];
    
    _titleLab1 = [[UILabel alloc] init];
    _titleLab1.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLab1];
    
    
    _showImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tb_icon1"]];
    _showImgView.contentMode = UIViewContentModeScaleAspectFit;
    _showImgView.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_showImgView];
    
    _logoIconImgView.layer.borderColor = [UIColor cyanColor].CGColor;
    _logoIconImgView.layer.borderWidth = 0.5;
    _logoIconImgView.layer.cornerRadius = 3;
    
    _tagLab0.layer.borderColor = [UIColor orangeColor].CGColor;
    _tagLab0.layer.borderWidth = 0.5;
    _tagLab0.layer.cornerRadius = 3;
    
    _tagLab1.layer.borderColor = [UIColor orangeColor].CGColor;
    _tagLab1.layer.borderWidth = 0.5;
    _tagLab1.layer.cornerRadius = 3;
    
    _showImgView.layer.borderColor = [UIColor redColor].CGColor;
    _showImgView.layer.borderWidth = 0.5;
    _showImgView.layer.cornerRadius = 3;
}


- (void)noticeCellWithArr:(NSArray *)arr forIndex:(NSUInteger)index
{
    NSDictionary *dic = arr[index];
    
    _showImgView.image = [UIImage imageNamed:dic[@"img"]];
    
    _tagLab0.text = [dic[@"arr"] firstObject][@"tag"];
    _titleLab0.text = [dic[@"arr"] firstObject][@"title"];
    
    _tagLab1.text = [dic[@"arr"] lastObject][@"tag"];
    _titleLab1.text = [dic[@"arr"] lastObject][@"title"];
}


@end
