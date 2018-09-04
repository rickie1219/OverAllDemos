//
//  TestGetDeviceColorVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/9/4.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestGetDeviceColorVC.h"

/**
 作者：指尖划过的风
 链接：https://www.jianshu.com/p/58b775d8e700
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */


@interface TestGetDeviceColorVC ()

@end

@implementation TestGetDeviceColorVC
{
    UILabel *_lblShowResult;
    UILabel *_lblDeviceColor;
    UILabel *_lblDeviceEnclosureColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showResult];
    [self getDeviceColor];
}

- (void)showResult
{
    _lblShowResult = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 60, 300, 150)];
    _lblShowResult.textColor = [UIColor blackColor];
    _lblShowResult.backgroundColor = [UIColor orangeColor];
    _lblShowResult.textAlignment = NSTextAlignmentCenter;
    _lblShowResult.numberOfLines = 0;
    [self.view addSubview:_lblShowResult];
    
    _lblDeviceColor = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, CGRectGetMaxY(_lblShowResult.frame)+10, 300, 150)];
    _lblDeviceColor.textColor = [UIColor blackColor];
    _lblDeviceColor.textAlignment = NSTextAlignmentCenter;
    _lblDeviceColor.numberOfLines = 0;
    [self.view addSubview:_lblDeviceColor];
    
    _lblDeviceEnclosureColor = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, CGRectGetMaxY(_lblDeviceColor.frame)+10, 300, 150)];
    _lblDeviceEnclosureColor.textColor = [UIColor blackColor];
    _lblDeviceEnclosureColor.textAlignment = NSTextAlignmentCenter;
    _lblDeviceEnclosureColor.numberOfLines = 0;
    [self.view addSubview:_lblDeviceEnclosureColor];
    
}

#pragma mark - 获取手机外壳颜色
- (void)getDeviceColor
{
    UIDevice *device = [UIDevice currentDevice];
    SEL selector = NSSelectorFromString(@"deviceInfoForKey:");
    if (![device respondsToSelector:selector]) {
        selector = NSSelectorFromString(@"_deviceInfoForKey:");
    }
    if ([device respondsToSelector:selector]) {
        IMP imp = [device methodForSelector:selector];
        NSString *(*func)(id,SEL,NSString*) = (void*)imp;
        // 设备颜色
        NSString *deviceColor = func(device,selector,@"DeviceColor");
        // 设备外壳颜色
        NSString *deviceEnclosureColor = func(device,selector,@"DeviceEnclosureColor");
        NSLog(@"deviceColor = %@ <--> deviceEnclosureColor = %@", deviceColor , deviceEnclosureColor);
        _lblShowResult.text = [NSString stringWithFormat:@"deviceColor = %@ <--> deviceEnclosureColor = %@", deviceColor , deviceEnclosureColor];
        _lblDeviceColor.backgroundColor = [UIColor colorWithHexString:deviceColor];
        _lblDeviceColor.text = [NSString stringWithFormat:@"deviceColor = %@", deviceColor];
        _lblDeviceEnclosureColor.backgroundColor = [UIColor colorWithHexString:deviceEnclosureColor];
        _lblDeviceEnclosureColor.text = [NSString stringWithFormat:@"deviceEnclosureColor = %@", deviceEnclosureColor];
    }
}


@end
