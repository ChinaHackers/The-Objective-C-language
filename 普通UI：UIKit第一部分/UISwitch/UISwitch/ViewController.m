//
//  ViewController.m
//  UISwitch
//
//  Created by Liu Chuan on 16/6/23.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UISwitch (开关控件)
    
    // 创建 UISwitch
    UISwitch *uiswitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 80, 20)];
    
    // 设置默认值
    uiswitch.on = YES;
    
    // 设置开关状态并带有动画效果
    [uiswitch setOn:YES animated:YES];
    
    // 设置开启状态下的颜色
    uiswitch.onTintColor = [UIColor colorWithRed:0.94 green:0.00 blue:0.51 alpha:1.00];
    
    // 设置关闭状态下的颜色
    uiswitch.tintColor = [UIColor colorWithRed:0.00 green:0.75 blue:0.96 alpha:1.00];
    
    // 设置圆形按钮颜色
    uiswitch.thumbTintColor = [UIColor whiteColor];
    
    // 给开关对象添加点击事件
    [uiswitch addTarget:self action:@selector(switchDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // 将开关对象,添加到当前视图控制器的根视图
    [self.view addSubview:uiswitch];
    
    
}

- (void)switchDidChange:(UISwitch*)uiswitch {
    
    // 获取开关对象的状态, 根据状态,打印不同的内容
    if (uiswitch.isOn) {
        
        NSLog(@"开关已打开");
        //将应用背景设为白色
        self.view.backgroundColor = [UIColor whiteColor];
        
    } else {
        
        NSLog(@"开关已关闭");
        //将应用背景设为白色
        self.view.backgroundColor = [UIColor blackColor];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
