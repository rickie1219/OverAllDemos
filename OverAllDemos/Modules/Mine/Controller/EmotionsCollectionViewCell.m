//
//  EmotionsCollectionViewCell.m
//  DemoForTestGestureCipher
//
//  Created by Rickie_Lambert on 2018/2/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "EmotionsCollectionViewCell.h"

@implementation EmotionsCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
        
        
        _lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2)];
        _lblTitle.textColor = [UIColor whiteColor];
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lblTitle];
        
        _lblCellFag = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_lblTitle.frame), self.frame.size.width, self.frame.size.height/2)];
        _lblCellFag.textColor = [UIColor whiteColor];
        _lblCellFag.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_lblCellFag];
        
    }
    return self;
}

@end
