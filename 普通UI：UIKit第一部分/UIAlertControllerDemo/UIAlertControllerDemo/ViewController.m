//
//  ViewController.m
//  UIAlertControllerDemo
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
    
    
}

- (IBAction)clicked:(UIButton *)sender {
    
    // UIAlertcontroller
    
    UIAlertController *alet = [UIAlertController alertControllerWithTitle:@"文本输入框" message:@"登录和密码提示框实例" preferredStyle: UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"输入正确,登录成功!!");
    }];
           
    [alet addAction:okAction];
    
   // 设置该警告框显示输入用户名和密码的输入框
   [alet addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"登录";
   }];
    
    [alet addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
        
        //开启密码暗文
        textField.secureTextEntry = YES;
    }];
    
    
    //弹出提示框
    [self presentViewController:alet animated:true completion:nil];
  
}
          

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

@end
