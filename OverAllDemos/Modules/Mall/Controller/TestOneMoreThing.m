//
//  TestOneMoreThing.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/9/21.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestOneMoreThing.h"
#import "UIColor+XRHexString.h"

@implementation TestOneMoreThing



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    v.center = self.view.center;
    [self.view addSubview:v];
    
    v.backgroundColor = [UIColor xr_colorWithHexString:0xFF0000];
}



@end
