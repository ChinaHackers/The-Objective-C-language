//
//  SecondViewController.m
//  UINavigationController
//
//  Created by Liu Chuan on 2016/12/12.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "SecondViewController.h"

// MARK: - 第二视图控制器
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Second";
    
    //self.view.backgroundColor = [UIColor purpleColor];
    
    // 创建第一张图片对象, 并添加图片到第一个控制器
    UIImageView *images = [[UIImageView alloc] initWithFrame: self.view.frame];
    
    images.image = [UIImage imageNamed: @"12.JPG"];
    
    // 设置图片显示比例
    // UIViewContentModeScaleToFill : 会导致图片变形。根据视图的比例去拉伸图片内容.
    images.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:images];

    
    
}

@end
