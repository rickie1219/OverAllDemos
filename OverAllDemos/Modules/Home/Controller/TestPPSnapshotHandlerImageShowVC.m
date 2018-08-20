//
//  TestPPSnapshotHandlerImageShowVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/20.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPPSnapshotHandlerImageShowVC.h"

@interface TestPPSnapshotHandlerImageShowVC ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TestPPSnapshotHandlerImageShowVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = self.capturedImage;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.scrollView addSubview:self.imageView];
    [self.view addSubview:self.scrollView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.capturedImage.size.height == UIScreen.mainScreen.bounds.size.height) {
        self.scrollView.contentOffset = CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.frame.size.height);
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat height = self.capturedImage.size.height;
    CGFloat width = self.capturedImage.size.width;
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake(width, height);
    
    self.imageView.frame = CGRectMake(0, 0, width, height);
}
@end
