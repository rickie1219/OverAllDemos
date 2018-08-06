//
//  TestPickerViewVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/7/7.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestPickerViewVC.h"

@interface TestPickerViewVC ()<UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation TestPickerViewVC
{
    UIButton *btnOrder;
    UILabel  *lblTitle;
    UIPickerView *pickView;
    
    UILabel *lblFruit;
    UILabel *lblMain;
    UILabel *lblWine;
    NSArray *foods;
    NSInteger itemRandom;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    foods = [NSArray array];
    foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
    
    NSLog(@"-----foods = %@", foods);
    
    
    
    
    btnOrder = [UIButton buttonWithType:UIButtonTypeCustom];
    btnOrder.frame = CGRectMake(20, 20, 100, 40);
    [btnOrder setTitle:@"Order" forState:UIControlStateNormal];
    [btnOrder setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    btnOrder.backgroundColor = [UIColor cyanColor];
    [btnOrder addTarget:self action:@selector(selectRandomMeal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOrder];
    
    
    lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnOrder.frame)+20, CGRectGetMinY(btnOrder.frame), 200, 40)];
    lblTitle.text = @"点餐系统";
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:lblTitle];
    
    
    pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnOrder.frame) + 20, self.view.frame.size.width, 300)];
    pickView.delegate = self;
    pickView.dataSource = self;
    pickView.showsSelectionIndicator = YES;
    pickView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:pickView];
    
    
    UILabel *lblFood_1 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(pickView.frame) + 20, 100, 40)];
    lblFood_1.text = @"水果";
    lblFood_1.textAlignment = NSTextAlignmentLeft;
    lblFood_1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lblFood_1];
    
    UILabel *lblFood_2 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lblFood_1.frame) + 20, 100, 40)];
    lblFood_2.text = @"主菜";
    lblFood_2.textAlignment = NSTextAlignmentLeft;
    lblFood_2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lblFood_2];
    
    UILabel *lblFood_3 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(lblFood_2.frame) + 20, 100, 40)];
    lblFood_3.text = @"饮料";
    lblFood_3.textAlignment = NSTextAlignmentLeft;
    lblFood_3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:lblFood_3];
    
    lblFruit = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblFood_1.frame)+20, CGRectGetMinY(lblFood_1.frame), 100, 40)];
    lblFruit.textAlignment = NSTextAlignmentCenter;
    lblFruit.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lblFruit];
    
    lblMain = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblFood_2.frame)+20, CGRectGetMinY(lblFood_2.frame), 100, 40)];
    lblMain.textAlignment = NSTextAlignmentCenter;
    lblMain.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lblMain];
    
    lblWine = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblFood_3.frame)+20, CGRectGetMinY(lblFood_3.frame), 100, 40)];
    lblWine.textAlignment = NSTextAlignmentCenter;
    lblWine.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lblWine];
    
    // 默认选中数据
    for (int i = 0; i < foods.count; i++) {
        [self pickerView:pickView didSelectRow:0 inComponent:i];
    }
    
}

#pragma mark - 点击随机按钮的时候调用
- (void)selectRandomMeal
{
    for (int i = 0; i < foods.count; i++) {
        // 第i组里面的所有数据
        NSUInteger count = [foods[i] count];
        // unsigned int 生成随机数去选中
        itemRandom = arc4random_uniform((int)count);
        
        // 获取第i组中当前选中的行itemRandom
        NSInteger selectRowItem = [pickView selectedRowInComponent:i];
        // 如果随机数与当前选中的行号一样，需要重新生成随机数
        while (selectRowItem == itemRandom) {
            itemRandom = arc4random_uniform((int)count);
        }
        // 让pickerView选中数据
        [pickView selectRow:itemRandom inComponent:i animated:YES];
        // 将数据显示到label上
        [self pickerView:pickView didSelectRow:itemRandom inComponent:i];
    }
}

#pragma mark - 数据源方法
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return [foods count];
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [foods[component] count];
}

#pragma mark - 代理方法
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return foods[component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *strSelect = foods[component][row];
    NSLog(@"cai %@ = component = %ld  row = %ld", strSelect, component, row);
    
    switch (component) {
        case 0:
            lblFruit.text = strSelect;
            break;
        case 1:
            lblMain.text = strSelect;
            break;
        case 2:
            lblWine.text = strSelect;
            break;
            
        default:
            break;
    }
}


@end
