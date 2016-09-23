//
//  ViewController.m
//  UIPickerView
//
//  Created by Liu Chuan on 16/7/5.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 定义一个数组,存储 UIPickerView 存储的数据
NSArray *books;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIPickerView 选择框
    // 选择框（UIPickerView）可以让用户以滑动的方式选择值
    // 建立选择框
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 20, 320, 216)];
    
    // 创建、并初始化NSArray对象.
    books = [NSArray arrayWithObjects:@"Objective-C", @"Swift", @"HTML", @"Java",nil];

    // 设置 UIPickerView 的代理\数据源协议为当前视图类本身.
    pickerView.delegate = self;
    pickerView.dataSource = self;
  
    // 添加到视图中
    [self.view addSubview:pickerView];

}

//MARK: -  UIPickerViewDataSource 中定义的方法

// 决定 UIPickerView 包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    // 返回1列
    return 1;
}

// 该控件指定列包含多少个列表项
// 指定UIPickerView 列, 包含多少个列表项.

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    // 由于该控件只包含一列，因此无需理会列序号参数component
    // 该方法返回books.count，表明books包含多少个元素，该控件就包含多少行
    return books.count;
}

// MARK: - UIPickerView Delegate
//该方法返回的 NSString 将作为 UIPickerView 中指定列、指定列表项的标题文本.

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    // 由于该控件只包含一列，因此无需理会列序号参数component
    // 该方法根据row参数来返回books中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用books中的第几个元素
    
    return [books objectAtIndex:row];
}

// 当用户选中UIPickerViewDataSource中指定列、指定列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    // 提示字符串
    NSString *message = [NSString stringWithFormat:@"你选中的图书是：%@",[books objectAtIndex:row]];
    
    // 使用一个 UIAlertController 来显示用户选中的列表项
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
