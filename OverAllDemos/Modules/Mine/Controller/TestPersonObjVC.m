//
//  TestPersonObjVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/10/5.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPersonObjVC.h"

#import "Person.h"   // NSObject
#import "NSObject+PersonPropertyRuntime.h"

@interface TestPersonObjVC ()

@end

@implementation TestPersonObjVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取 Person 类的属性数组
    NSArray *properties = [Person xr_objProperties];
    
    
    // 目标 => 1. name, age => KVC 设置数值
    // 目标 => 2.字典转模型设置数值
    NSLog(@"%@", properties);
    
    
    // 字典转模型
    Person *person = [Person xr_objWithDictionary:@{@"name": @"Zhangsan",
                                                    @"age": @18,
                                                    @"title": @"boss",
                                                    @"height": @1.9,
                                                    @"daxigua": @"xxxx"
                                                    }];
    
    NSLog(@"对象字典： %@", person);
    
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imgView.center = self.view.center;
    [self.view addSubview:imgView];
    
    // 设置图像 - bundle 中的 jpg 在加载的时候，需要指定扩展名
    imgView.image = [UIImage imageNamed:@"img_index_02bg"];
    //imgView setImage:<#(UIImage * _Nullable)#>
    
    // 目标：在设置图像的时候，干一些事情！ NSLog
    
}


@end
