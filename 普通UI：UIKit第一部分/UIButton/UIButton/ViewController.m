//
//  ViewController.m
//  UIButton
//
//  Created by Liu Chuan on 16/6/1.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    #pragma mark 按钮的使用
    [self UIButton_Demo];
 
    
}

#pragma mark 按钮(UIButton)
- (void)UIButton_Demo {
 
/*  按钮的类型:
     [UIButton buttonWithType:UIButtonTypeContactAdd];       "+"图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
     [UIButton buttonWithType:UIButtonTypeDetailDisclosure]; "!"图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
     [UIButton buttonWithType:UIButtonTypeSystem];           系统自带,不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
     [UIButton buttonWithType:UIButtonTypeCustom];          定制按钮，不带图标，默认文字颜色为白色，无触摸时的高亮效果
     [UIButton buttonWithType:UIButtonTypeRoundedRect];      圆角按钮
*/
    
    // 创建一个圆角按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 设置按钮的位置 \ 大小
    button.frame = CGRectMake(10, 150, 100, 60);
    
#pragma mark 按钮的文字、颜色、状态
    // 设置按钮的文字
    [button setTitle:@"点我啊" forState:UIControlStateNormal];
    
    // 不同状态下的按钮设置不同的文字和颜色。
    [button setTitle:@"普通状态" forState: UIControlStateNormal];
    [button setTitle:@"触摸状态" forState: UIControlStateHighlighted];
    [button setTitle:@"禁用状态" forState: UIControlStateDisabled];
    
    // setTitleColor: 设置不同状态下的字体颜色
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor grayColor ] forState:UIControlStateDisabled];
    
    // setTitleShadowColor: 设置不同状态下的阴影颜色
    
    [button setTitleShadowColor:[UIColor greenColor ] forState:UIControlStateNormal];
    [button setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button setTitleShadowColor:[UIColor grayColor  ] forState:UIControlStateDisabled];
    
    // 设置按钮的背景色，用UIView 的 backgroundColor 属性设置
    button.backgroundColor = [UIColor orangeColor];
    
#pragma mark 按钮的图片
    
    // 设置按钮的图标
    [button setImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    
    // 当按钮处于触摸（高亮）的状态下，按钮图标会变暗。
    // 如果不想变暗，可以设置:
    button.adjustsImageWhenHighlighted = NO;
    
    //同理，还可以设置按钮在禁用状态下 图标不变暗
    button.adjustsImageWhenDisabled = NO;
    
    // 用 setBackgroundImage 设置按钮的背景图片
    [button setBackgroundImage:[UIImage imageNamed:@"background"] forState:UIControlStateNormal];
    
    
#pragma mark 按钮的触摸事件
    
    // 在按钮被触摸时，会执行一些程序，用 addTarget 方法监听按钮触摸事件
/*
     第一个参数：传递一个对象. 第二个参数 action：传递对象的方法, 第三个参数 forControlEvents：传递 事件类型
*/
    // 如果需要在tapped 方法中获得按钮对象，需要在定义action 参数时，方法名称后带上冒号
    [button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

// 因为上面按钮触摸代码第一个参数 传递为self，所以需要在当前类中声明一个 tapped方法
// 当按钮被点击了，会调用这个方法
- (void)tapped:(UIButton *)button{
    
    NSLog(@"按钮被点击了!!!!!!");
}


@end
