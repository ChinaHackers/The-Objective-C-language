//
//  ViewController.m
//  UISlider
//
//  Created by Liu Chuan on 16/6/24.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 滑块(UISlider)
    
    // 滑块的创建
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 60, 280, 50)];
    
    // 滑块的 minimumValue 属性设置了滑块滑到 最左端时的最小值, 可以是负值
    slider.minimumValue = 0;
    
    // 滑块的 maximumValue 属性设置了滑块滑到 最右端时的最大值
    slider.maximumValue = 3;
    
    // value属性 用于设置、获得滑块的默认值 - >滑块的位置
    slider.value = 0.2;
    
    // 滑块的设置值还可以用setValue方法
    // animated 参数设置了 改变值是否显示动画效果
    [slider setValue:2 animated:YES];
    
    
    // 如果属性continuous 为NO，这时将滑块移动停止后，才会触发ValueChanged事件
    slider.continuous = YES;
    // 制定滑块的样式
    // 通过 minimumTrackTintColor 和 maximumTrackTintColor 设置滑块左右俩边的颜色
    slider.minimumTrackTintColor = [UIColor whiteColor];
    slider.maximumTrackTintColor = [UIColor blackColor];
    
    // 设置滑块的颜色
    slider.thumbTintColor = [UIColor magentaColor];
    
    // 通过 minimumValueImage 和 maximumValueImage 2个属性向滑块左右俩边增加图标
    slider.minimumValueImage = [UIImage imageNamed:@"volume-down"];
    slider.maximumValueImage = [UIImage imageNamed:@"volume-up"];

    // 设置滑块的图片
   // [slider setThumbImage:[UIImage imageNamed:@"8890"] forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor lightTextColor];
    
    // 对滑动条添加事件
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
}


- (void) sliderChange: (UISlider*)slider {
    
    NSLog(@"%.2f",slider.value);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
