//
//  MallViewController.m
//  RuiFengPartyBuilding
//
//  Created by Rickie_Lambert on 2018/1/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "MallViewController.h"

#import "TestLottieViewController.h"


@interface MallViewController ()
{
    LOTAnimationView *lottieAnimation;
    LOTAnimationView *laAnimation;
}

@end

@implementation MallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((self.view.frame.size.width - 280)/2, 30, 280, 50);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"QMUIAlert Test" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(userDefineAlertVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btnTestCrash = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTestCrash.frame = CGRectMake(CGRectGetMinX(btn.frame), CGRectGetMaxY(btn.frame)+10, btn.frame.size.width, btn.frame.size.height);
    btnTestCrash.backgroundColor = [UIColor redColor];
    [btnTestCrash setTitle:@"测试崩溃 <慎点!!>" forState:UIControlStateNormal];
    [btnTestCrash setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnTestCrash addTarget:self action:@selector(demoForCrash) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTestCrash];
    
    UIButton *btnTestLottie = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTestLottie.frame = CGRectMake(CGRectGetMinX(btnTestCrash.frame), CGRectGetMaxY(btnTestCrash.frame)+10, btnTestCrash.frame.size.width, btnTestCrash.frame.size.height);
    btnTestLottie.backgroundColor = [UIColor orangeColor];
    [btnTestLottie setTitle:@"测试Lottie" forState:UIControlStateNormal];
    [btnTestLottie setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnTestLottie addTarget:self action:@selector(toTestPage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnTestLottie];
    
    
    UIImageView *imgAnimation = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, CGRectGetMaxY(btnTestLottie.frame)+20, 80, 80)];
    imgAnimation.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:imgAnimation];
    
    // 获取网络资源的Lottie资源Json文件
    NSString *strUrl = @"https://www.lottiefiles.com/storage/datafiles/jEgAWaDrrm6qdJx/data.json";
    
    lottieAnimation = [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:strUrl]];
    lottieAnimation.contentMode = UIViewContentModeScaleAspectFill;
    lottieAnimation.frame = imgAnimation.bounds;
    [imgAnimation addSubview:lottieAnimation];
    lottieAnimation.animationProgress = 0;
    [lottieAnimation play];
    lottieAnimation.loopAnimation = YES;
    
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(imgAnimation.frame)+20, self.view.frame.size.width - 40*2, 250)];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    
    // 加载本地的lottie的json文件
    laAnimation = [LOTAnimationView animationNamed:@"LottieLogo2"];
    laAnimation.backgroundColor = [UIColor yellowColor];
    laAnimation.frame = view.bounds;
    laAnimation.contentMode = UIViewContentModeScaleAspectFill;
    [view addSubview:laAnimation];
    [laAnimation play];
    laAnimation.loopAnimation = YES;
    [self.view setNeedsLayout];
    
}


#pragma mark - 测试腾讯bugly错误收集
- (void)demoForCrash
{
    NSString *str = nil;
    NSArray *arr = @[@"hello", str];
    DLog(@"%@", arr);
    NSLog(@"%@", arr);
}

- (void)toTestPage
{
    TestLottieViewController *vc = [[TestLottieViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)userDefineAlertVC:(UIButton *)sender
{
    DLog(@"%@", sender);
    // 底部按钮
    QMUIAlertAction *action1 = [QMUIAlertAction actionWithTitle:@"取消" style:QMUIAlertActionStyleCancel handler:NULL];
    QMUIAlertAction *action2 = [QMUIAlertAction actionWithTitle:@"删除" style:QMUIAlertActionStyleDefault handler:NULL];
    
    [action2.button setImage:[[UIImageMake(@"icon_emotion") qmui_imageResizedInLimitedSize:CGSizeMake(18, 18) contentMode:UIViewContentModeScaleToFill] qmui_imageWithTintColor:[UIColor purpleColor]] forState:UIControlStateNormal];
    action2.button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8);
    
    // 弹窗
    QMUIAlertController *alertController = [[QMUIAlertController alloc] initWithTitle:@"确定删除？" message:@"删除后将无法恢复，请慎重考虑" preferredStyle:QMUIAlertControllerStyleAlert];
    NSMutableDictionary *titleAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertTitleAttributes];
    titleAttributs[NSForegroundColorAttributeName] = UIColorWhite;
    alertController.alertTitleAttributes = titleAttributs;
    NSMutableDictionary *messageAttributs = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertMessageAttributes];
    messageAttributs[NSForegroundColorAttributeName] = UIColorMakeWithRGBA(255, 255, 255, 0.75);
    alertController.alertMessageAttributes = messageAttributs;
    alertController.alertHeaderBackgroundColor = [UIColor purpleColor];
    alertController.alertSeperatorColor = alertController.alertButtonBackgroundColor;
    alertController.alertTitleMessageSpacing = 7;
    
    NSMutableDictionary *buttonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertButtonAttributes];
    buttonAttributes[NSForegroundColorAttributeName] = alertController.alertHeaderBackgroundColor;
    alertController.alertButtonAttributes = buttonAttributes;
    
    NSMutableDictionary *cancelButtonAttributes = [[NSMutableDictionary alloc] initWithDictionary:alertController.alertCancelButtonAttributes];
    cancelButtonAttributes[NSForegroundColorAttributeName] = buttonAttributes[NSForegroundColorAttributeName];
    alertController.alertCancelButtonAttributes = cancelButtonAttributes;
    
    [alertController addAction:action1];
    [alertController addAction:action2];
    [alertController showWithAnimated:YES];
}



@end