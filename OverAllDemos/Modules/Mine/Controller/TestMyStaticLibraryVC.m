//
//  TestMyStaticLibraryVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/6.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestMyStaticLibraryVC.h"
#import "DemoForStaticLibrary.h"

@interface TestMyStaticLibraryVC ()<UITextFieldDelegate>
{
    UITextField *tfNumFirst;
    UITextField *tfNumSecond;
    UILabel *lblAdd;
    UILabel *lblEqual;
    UILabel *lblResult;
    UIButton *btnSum;
}

@end

@implementation TestMyStaticLibraryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initSubViews];
}

- (void)initSubViews
{
    
    
    tfNumFirst = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 90, 50)];
    tfNumFirst.backgroundColor = [UIColor orangeColor];
    tfNumFirst.delegate = self;
    tfNumFirst.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tfNumFirst.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tfNumFirst];
    
    lblAdd = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(tfNumFirst.frame)+10, CGRectGetMinY(tfNumFirst.frame), 90, 50)];
    lblAdd.text = @"+";
    lblAdd.textAlignment = NSTextAlignmentCenter;
    lblAdd.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:lblAdd];
    
    
    tfNumSecond = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblAdd.frame)+10, CGRectGetMinY(lblAdd.frame), 90, 50)];
    tfNumSecond.backgroundColor = [UIColor orangeColor];
    tfNumSecond.delegate = self;
    tfNumSecond.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    tfNumSecond.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tfNumSecond];
    
    lblEqual = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(tfNumFirst.frame), CGRectGetMaxY(tfNumSecond.frame)+10, 90, 50)];
    lblEqual.text = @"=";
    lblEqual.textAlignment = NSTextAlignmentCenter;
    lblEqual.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:lblEqual];
    
    lblResult = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblEqual.frame)+10, CGRectGetMinY(lblEqual.frame), 90, 50)];
    lblResult.text = @"";
    lblResult.textAlignment = NSTextAlignmentCenter;
    lblResult.backgroundColor = [UIColor greenColor];
    [self.view addSubview:lblResult];
    
    btnSum = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSum.frame = CGRectMake(50, CGRectGetMaxY(lblResult.frame)+30, 90, 50);
    btnSum.backgroundColor = [UIColor redColor];
    [btnSum setTitle:@"Sum" forState:UIControlStateNormal];
    [btnSum addTarget:self action:@selector(sumNumbersTotal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSum];
    
}


- (void)sumNumbersTotal
{
    NSInteger first = [tfNumFirst.text integerValue];
    NSInteger second = [tfNumSecond.text integerValue];
    /**判断输入框内是否为空的方法，用户在没有输入的情况下的判断*/
    if (0 == tfNumFirst.text.length) {
        NSLog(@"请输入数字1");
        return;
    }
    if (0 == tfNumSecond.text.length) {
        NSLog(@"请输入数字2");
        return;
    }
    
    NSInteger result = [DemoForStaticLibrary numberFirst:first addNumberSecond:second];
    NSInteger resultMathTool = [MathTool numFirst:first addNumSecond:second];
    
    lblResult.text = [NSString stringWithFormat:@"%ld", result];
    NSLog(@"输出第1个方法的值等于 = %ld", result);
    NSLog(@"输出第二个方法的值等于 = %ld", resultMathTool);
    /**计算结束后，收起键盘*/
    [self.view endEditing:YES];
}


#pragma mark - 收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}





@end
