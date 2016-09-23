//
//  ViewController.m
//  UISegmentedControl
//
//  Created by Liu Chuan on 16/7/19.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


 /******  根据UISegmentedControl被选中的索引,变换背景颜色 ******/
- (IBAction)segmentChanged:(UISegmentedControl *)sender {
   
    // 根据UISegmentedControl被选中的索引
    switch (sender.selectedSegmentIndex) {
        case 0:
            // 将应用背景设为红色
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 1:
            // 将应用背景设为绿色
            self.view.backgroundColor = [UIColor greenColor];
            break;
        case 2:
            // 将应用背景设为橙色
            self.view.backgroundColor = [UIColor orangeColor];
            break;
        case 3:
            // 将应用背景设为紫色
            self.view.backgroundColor = [UIColor purpleColor];
            break;
        default:
            NSLog(@"-------");
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
