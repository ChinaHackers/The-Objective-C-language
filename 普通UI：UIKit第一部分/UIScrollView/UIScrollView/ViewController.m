//
//  ViewController.m
//  UIScrollView
//
//  Created by Liu Chuan on 16/7/19.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 定义3个常量用来表示 4个页面, 页面宽度: 320, 高度: 360
    numOfPages = 4;
    pageWidth = 320;
    pageHeight = 568;
    
    
    // 设置画布大小, 画布显示在滚动视图内部, 一般大于 Frame 的大小
    // 为了能让内容横向滚动, 设置横向宽度为 3个页面的宽度总和
    _scrollView.contentSize = CGSizeMake(pageWidth * numOfPages, pageHeight);
    
    // 使用 for 循环创建4张图片
    for (int i = 0; i < numOfPages; i++) {
        
        NSString *str = [NSString stringWithFormat:@"%d.jpg", i+1];
        
        UIImage *image = [UIImage imageNamed: str];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        // 当前可视化视图
        imageView.frame = CGRectMake(pageWidth * i, 0, pageWidth, pageHeight);
        
        [_scrollView addSubview:imageView];
        
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
