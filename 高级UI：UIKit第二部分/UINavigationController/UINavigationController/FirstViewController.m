//
//  FirstViewController.m
//  UINavigationController
//
//  Created by Liu Chuan on 2016/12/12.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"


// MARK: - 第一视图控制器
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self FirstViewController_demo];

}

//MARK: - FirstViewController属性设置
- (void)FirstViewController_demo {
    
    // 设置当前视图控制器, 在导航视图控制器中的标题
    self.navigationItem.title = @"First";
    
    
    // 设置顶部导航区的提示文字
    self.navigationItem.prompt = @"Loading....";
    
    // 设置导航栏的背景颜色
    //self.navigationController.navigationBar.barTintColor = [UIColor cyanColor];
    
    // 设置导航栏的items颜色
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    
    // 设置导航栏的背景是否透明
    [self.navigationController.navigationBar setTranslucent:YES];
    
    // 设置导航栏的系统样式
    [self.navigationController.navigationBar setBarStyle: UIBarStyleDefault];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 设置右上角导航按钮的样式\功能.
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"First" style: UIBarButtonItemStylePlain target:self action:@selector(nextPage)];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    // 设置左上角的按钮样式
    // 实例化一个工具条按钮对象
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
 
    // 设置导航栏左侧按钮 为 工具条对象
    self.navigationItem.leftBarButtonItem = leftBar;

    // 创建第一张图片对象, 并添加图片到第一个控制器
    UIImageView *images = [[UIImageView alloc] initWithFrame: self.view.frame];
    
    images.image = [UIImage imageNamed: @"14.JPG"];
    
    // 设置图片显示比例
    //   UIViewContentModeScaleToFill     会导致图片变形。根据视图的比例去拉伸图片内容.
    images.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:images];

}

//MARK: 添加视图控制器跳转方法
- (void)nextPage {
    
    // 初始化第二个视图控制器对象
    SecondViewController *Second = [[SecondViewController alloc] init];
    
    // 将第二个视图控制器 压入导航视图控制器中, 实现界面跳转.
    [self.navigationController pushViewController: Second animated:YES];
    
    
}

//MARK: 刷新功能的实现
- (void)refresh {
    
    // 创建警告弹出窗口
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message: @"正在努力的刷新中..." preferredStyle: UIAlertControllerStyleAlert];
    
    // 创建提示窗口中的[确定]按钮
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    // 将确定按钮添加到提示窗口中
    
    [alert addAction:okAction];

    // 显示提示窗口
    [self presentViewController:alert animated:YES completion:nil];

}

@end
