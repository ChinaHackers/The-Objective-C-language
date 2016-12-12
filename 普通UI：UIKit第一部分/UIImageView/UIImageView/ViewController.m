//
//  ViewController.m
//  UIImageView
//
//  Created by Liu Chuan on 16/6/23.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 创建一个NSArray集合，其中集合元素都是UIImage对象
NSArray *array;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIImageView 的使用
    [self UIImageView_Demo];

}

#pragma mark UIImageView 的使用
- (void)UIImageView_Demo {
    
    // UIImageView (图像组件)
    // 创建一个NSArray集合，其中集合元素都是UIImage对象
    array = [NSArray arrayWithObjects: [UIImage imageNamed:@"lijiang.jpg"],
             [UIImage imageNamed:@"qiao.jpg"],
             [UIImage imageNamed:@"xiangbi.jpg"],
             [UIImage imageNamed:@"shui.jpg"],
             [UIImage imageNamed:@"shuangta.jpg"], nil];
    
    // 设置动画持续时间
    self.images.animationDuration = 15;
    
    // 设置动画重复次数
    self.images.animationRepeatCount = 999999;
    
    // 让iv控件开始播放动画
    [self.images startAnimating];

}

@end
