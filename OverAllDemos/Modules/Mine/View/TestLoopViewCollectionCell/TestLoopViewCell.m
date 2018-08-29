//
//  TestLoopViewCell.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/30.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestLoopViewCell.h"

@implementation TestLoopViewCell{
    UIImageView *_imageView;
}

// collectionViewCell 的frame 是根据之前的 layout 已经确定好的
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"----9990 -----%@", NSStringFromCGRect(frame));
        
        // 添加图像
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        // 将视图添加到当前cell视图上
        [self.contentView addSubview:_imageView];
        _imageView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


- (void)setUrl:(NSURL *)url
{
    _url = url;
    
    // 1.根据 URL 获取二进制数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    // 2. 将二进制数据转换成图像
    UIImage *img = [UIImage imageWithData:data];
    
    _imageView.image = img;
}


@end
