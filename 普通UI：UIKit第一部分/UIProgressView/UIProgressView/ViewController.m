//
//  ViewController.m
//  UIProgressView
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
    
    
    // 进度条（UIProgressView）
    
    // 创建进度条
    
    // 实例化 UIProgressView 类可以创建一个进度条
    // 进度条的高度是不可变的
    UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(20, 100, 280, 20)];
    
    
    // 设置进度条风格
    // UIProgressViewStyleDefault: 默认风格的进度条
    // UIProgressViewStyleBar:     工具条风格的进度条
    progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    // progress 属性可以设置进度条进度
    // 0.5表示 进度为：50%  取值: 0-1
    progressView.progress = 0.5;
    
    // 进度设置为80%，animated 参数，表示在变化进度时是否需要动画效果
    [progressView setProgress:0.8 animated:YES];
    
    // progressTintColor :属性设置进度条上已经完成进度的颜色
    progressView.progressTintColor = [UIColor whiteColor];
    
    // trackTintColor 属性: 设置剩余的进度的颜色
    progressView.trackTintColor = [UIColor grayColor];
    
    // 设置主视图为黑色
    self.view.backgroundColor = [UIColor blackColor];
    
    // 将进度条显示到视图上
    [self.view addSubview:progressView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
