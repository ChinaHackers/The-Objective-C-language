//
//  ViewController.m
//  UIActionSheet
//
//  Created by Liu Chuan on 16/6/2.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 动作表 ActionSheet
    
    
    // 创建一个按钮, 点击按钮时,弹出警告窗口
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    //设置按钮的位置
//    btn.frame = CGRectMake(120, 166, 120, 30)
    
    btn.frame = CGRectMake(120, 166, 120, 30);
    
    //设置按钮在正常状态下的标题文字
    
    [btn setTitle:@"弹出警告框" forState:UIControlStateNormal];
    
    //设置按钮字体\大小
    btn.titleLabel.font = [UIFont fontWithName:@"System" size:15];
    
    // 给按钮绑定点击事件
    [btn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置按钮背景色为 橙色
    btn.backgroundColor = [UIColor orangeColor];
    
    // 将按钮添加到当前视图控制器的根视图
    [self.view addSubview:btn];
    
}

#pragma mark - 显示 ActionSheet
- (void)show:(UIButton *)button {

    
    // 3.操作表的使用 ( UIActionSheet )
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"请选择学习语言" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
   
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"用户没有喜欢的语言！");
        
    }];
    
   
    UIAlertAction *OneButton = [UIAlertAction actionWithTitle:@"Objective - C" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Objective-C是非常实用的语言！");
        
    }];
    
    UIAlertAction *TwoButton = [UIAlertAction actionWithTitle:@"Swift" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"Swift是一款易学易用的编程语言！");
        
    }];
    
    
    UIAlertAction *ThreeButton = [UIAlertAction actionWithTitle:@"HTML5" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSLog(@"HTML5是万维网的核心语言！");
        
    }];

    [actionSheet addAction:OneButton];
    [actionSheet addAction:TwoButton];
    [actionSheet addAction:ThreeButton];
    [actionSheet addAction:cancelButton];
    
    
    [self presentViewController:actionSheet animated:YES completion:nil];


}


@end
