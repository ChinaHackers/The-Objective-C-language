//
//  ViewController.m
//  UIAlertView
//
//  Created by Liu Chuan on 16/6/1.
//  Copyright © 2016年 LC. All rights reserved.
//


/*
 在iOS 8中，UIAlertController在功能上是和UIAlertView以及UIActionSheet相同的，UIAlertController以一种模块化替换的方式来代替这两货的功能和作用。
 是使用对话框(alert)还是使用上拉菜单(action sheet)，就取决于在创建控制器时，您是如何设置首选样式的。
 
 
 同创建UIAlertView相比，我们无需指定代理，也无需在初始化过程中指定按钮。不过要特别注意第三个参数，要确定您选择的是对话框样式还是上拉菜单样式。
 
 通过创建UIAlertAction的实例，您可以将动作按钮添加到控制器上。UIAlertAction由标题字符串、样式以及当用户选中该动作时运行的代码块组成。通过UIAlertActionStyle，您可以选择如下三种动作样式：常规(default)、取消(cancel)以及警示(destruective)。
 
 为了实现原来我们在创建UIAlertView时创建的按钮效果，我们只需创建这两个动作按钮并将它们添加到控制器上即可。
 //最后，我们只需显示这个对话框视图控制器即可：
 
 
 */


#import "ViewController.h"

@interface ViewController ()


- (IBAction)showAlert:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

// 显示警告框
- (IBAction)showAlert:(UIButton *)sender {
    
    
    // 警告框（UIAlertView）
    // 警告框的使用 ：用于提醒用户一些警告确认信息。
    
    //同创建UIAlertView相比，我们无需指定代理，也无需在初始化过程中指定按钮。不过要特别注意第三个参数，要确定您选择的是对话框样式还是上拉菜单样式。
    
    // 通过创建 UIAlertAction 的实例，您可以将动作按钮添加到控制器上。
    // UIAlertAction 由标题字符串、样式以及当用户选中该动作时运行的代码块组成。
    // 通过 UIAlertActionStyle，您可以选择如下三种动作样式：常规(default)、取消(cancel)以及警示(destruective)。
    // 为了实现原来我们在创建 UIAlertView 时创建的按钮效果，我们只需创建这两个动作按钮并将它们添加到控制器上即可。
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是 UIAlertView 的默认样式" preferredStyle:UIAlertControllerStyleAlert];
   
    
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    
    
    [alertView addAction:resetAction];
    [alertView addAction:cancelAction];
    [alertView addAction:okAction];
    
    [self presentViewController:alertView animated:YES completion:nil];
    
    
   
    
}
@end
