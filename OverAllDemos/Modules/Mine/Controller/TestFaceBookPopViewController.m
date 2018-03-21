//
//  TestFaceBookPopViewController.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/3/8.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestFaceBookPopViewController.h"

@interface TestFaceBookPopViewController ()
{
    UIButton *btnTest;
    UILabel *moveView;
    
    UIView *lblShow;
}


@end

@implementation TestFaceBookPopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    btnTest = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTest.frame = CGRectMake((self.view.frame.size.width - 100)/2, 50, 100, 50);
    btnTest.backgroundColor = [UIColor orangeColor];
    [btnTest setTitle:@"Click Me" forState:UIControlStateNormal];
    [btnTest addTarget:self action:@selector(testViewAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTest];
    
    
    moveView = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, CGRectGetMaxY(btnTest.frame)+20, 200, 200)];
    moveView.text = @"Look Me Shake";
    moveView.textAlignment = NSTextAlignmentCenter;
    moveView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:moveView];
    
    
    lblShow = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, CGRectGetMaxY(moveView.frame)+20, 200, 50)];
//    lblShow.text = @"Let Me Move";
//    lblShow.textAlignment = NSTextAlignmentCenter;
    lblShow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:lblShow];
    
}


- (void)testViewAnimation:(UIButton *)sender
{
    // 按钮点击之后，按钮的用户交互就关闭，让按钮点击无响应事件
    btnTest.userInteractionEnabled = NO;
    [self shakeLabel];
    
    NSLog(@"sender.isSelected = %d", sender.isSelected);
    NSLog(@"sender.selected = %d", sender.selected);
    sender.selected = !sender.isSelected;
    NSLog(@"===!sender.isSelected = %d", !sender.isSelected);
    NSLog(@"=== sender.selected = %d", sender.selected);
    NSLog(@"----------------------------------------\n\n");
    
    //[self moveLabel:sender.selected];
}


- (void)shakeLabel
{
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    positionAnimation.velocity = @2000;
    positionAnimation.springBounciness = 20;
    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
        // 等动画执行结束以后，让按钮的用户交互打开，让按钮再次响应用户点击事件
        btnTest.userInteractionEnabled = YES;
    }];
    [moveView.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
}

- (void)moveLabel:(BOOL)isClick
{
    POPBasicAnimation *layerAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    layerAnimation.toValue = isClick ? @30 : @(-30);
    [layerAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        btnTest.userInteractionEnabled = YES;
        lblShow.backgroundColor = [UIColor redColor];
    }];
    [lblShow.layer pop_addAnimation:layerAnimation forKey:nil];
    //[lblShow.layer pop_addAnimation:layerAnimation forKey:@"layerScaleAnimation"];
}




@end
