//
//  ViewController.m
//  UI_stepper
//
//  Created by Liu Chuan on 16/7/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIStepper *stepper;
@property(nonatomic, strong) UILabel *label;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self UIStepper_Demo];
 
}

//MARK: - 微调器 (UIStepper)
- (void)UIStepper_Demo {
    
    // 创建 UIStepper
    // UIStepper *_stepper = [[UI_stepper alloc] init];
    
    _stepper = [[UIStepper alloc] init];
    
    // 设置 _stepper 的位置.
    _stepper.center = self.view.center;
    
    // 设置 _stepper 的范围与初始值
    // maximumValue: 最大值
    // minimumValue: 最小值
    _stepper.maximumValue = 10;
    _stepper.minimumValue = 0;
    
    // 设置微调器的当前值, 默认值为: 0
    _stepper.value = 5;
    
    // 设置每次增加\减小的值
    _stepper.stepValue = 1;
    
    //continuous: 表示可以按下不放, 连续更改值.
    _stepper.continuous = YES;
    
    // 是否可以重复响应事件
    _stepper.autorepeat = YES;
    
    // wraps属性设置_stepper是否循环（当到最大值时，再点击加号来增加数值，将又从最小值开始）
    _stepper.wraps = YES;
    
    // 添加事件函数
    // UIControlEvents.ValueChanged: 事件值改变状态, 来获取数值的变化
    [_stepper addTarget:self action:@selector(_stepperValueChanged) forControlEvents:UIControlEventValueChanged];
    
    // 添加微调器到视图中
    [self.view addSubview:_stepper];
    
    
    // 创建一个 UILabel 来获取 _stepper 的值
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    
    [self.view addSubview:_label];
    
}

// _stepper 的点击事件
- (void)_stepperValueChanged{
    
    // _stepper.value值为 double 类型, 转换为 string 类型
    NSString *str = [NSString stringWithFormat:@"当前数值为:%.2f", _stepper.value];
    
    _label.text = str;

}


@end
