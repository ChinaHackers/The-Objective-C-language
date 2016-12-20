//
//  ViewController.m
//  UIPageControl
//
//  Created by Liu Chuan on 2016/12/19.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // UIPageControl (分页控制器)
    [self PageControl_Demo];
    
}

// MARK: - UIPageControl (分页控制器)
- (void)PageControl_Demo {
    
    // 获取当前屏幕尺寸
    CGRect screenFrame = [[UIScreen mainScreen]bounds];
    
    // 获取屏幕尺寸的 宽\高
    CGFloat screenWidth = screenFrame.size.width;
    CGFloat screenHeight = screenFrame.size.height;
    
    // 设置页面控制器的显示区域
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, screenHeight - self.view.frame.size.height, screenWidth, self.view.bounds.size.height)];
    
    
    // MARK: 设置页面控制器对象的总页数
    pageControl.numberOfPages = 6;
    
    // MARK: 设置页面控制器的当前页码
    pageControl.currentPage = 0;
    
    // MARK: 设置当前页码小白点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    // MARK: 设置未选择页面小白点的颜色
    pageControl.pageIndicatorTintColor = [UIColor grayColor];

    // MARK: 设置页面控制器的背景颜色
    pageControl.backgroundColor = [UIColor orangeColor];
    
    // MARK: 给页面控制器添加 监听方法
    [pageControl addTarget:self action:@selector(changed:) forControlEvents: UIControlEventValueChanged];
    
    [self.view addSubview:pageControl];
}

//MARK: 实现页面控制器的方法
- (void)changed: (UIPageControl *)page {
    
    NSLog(@"当前在第%ld页!", page.currentPage);
}

@end
