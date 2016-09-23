//
//  ViewController.m
//  UIStepper
//
//  Created by Liu Chuan on 16/7/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 微调器 (UIStepper)
    
    // 创建 UIStepper
   // UIStepper *stepper = [[UIStepper alloc] init];
    
    stepper = [[UIStepper alloc] init];
    
    // 设置 stepper 的位置.
    stepper.center = self.view.center;
    
    // 设置 stepper 的范围与初始值
    // maximumValue: 最大值
    // minimumValue: 最小值
    stepper.maximumValue = 10;
    stepper.minimumValue = 0;
    
    // 设置微调器的当前值, 默认值为: 0
    stepper.value = 5;
    
    // 设置每次增加\减小的值
    stepper.stepValue = 1;
    
    //continuous: 表示可以按下不放, 连续更改值.
    stepper.continuous = YES;
    
    // 是否可以重复响应事件
    stepper.autorepeat = YES;
    
    // wraps属性设置stepper是否循环（当到最大值时，再点击加号来增加数值，将又从最小值开始）
    stepper.wraps = YES;
    
    // 添加事件函数
    // UIControlEvents.ValueChanged: 事件值改变状态, 来获取数值的变化
    [stepper addTarget:self action:@selector(stepperValueChanged) forControlEvents:UIControlEventValueChanged];
    
    // 添加微调器到视图中
    [self.view addSubview:stepper];
    
    
    // 创建一个 UIlabel 来获取 Stepper 的值
    label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    
    [self.view addSubview:label];
    
}

// stepper 的点击事件
- (void)stepperValueChanged{
    
    // stepper.value值为 double 类型, 转换为 string 类型
    NSString *str = [NSString stringWithFormat:@"当前数值为:%.2f", stepper.value];
    
    label.text = str;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
