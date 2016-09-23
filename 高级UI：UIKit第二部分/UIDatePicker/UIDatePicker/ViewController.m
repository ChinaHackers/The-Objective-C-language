//
//  ViewController.m
//  UIDatePicker
//
//  Created by Liu Chuan on 16/8/30.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *_datePicker;
@property (weak, nonatomic) IBOutlet UIButton *btnShow;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 日期选择器（UIDatePicker）
    
    // 1.UIDatePicker 控件介绍 用于选择日期\时间
    //用于测试 UIDatePicker 的属性取值
    
    NSLog(@"%@", __datePicker.locale.localeIdentifier);
    NSLog(@"%@", __datePicker.calendar.calendarIdentifier);
    
    UIDatePicker *date = __datePicker.date;
    
    NSLog(@"%@", date descriptionWithLocale(datePicker.locale));

}



- (IBAction)ShowClicked:(UIButton *)sender {
    
    UIDatePicker *date = __datePicker.date;
    
    // 创建一个日期格式器
    NSDateFormatter *dateFormatter = NSDateFormatterNoStyle;
    
    // 为日期格式器设置格式字符串
    dateFormatter.dateFormat = @"yyyy 年 MM 月 dd 日 HH:mm:ss";
    
    // 使用日期格式器，格式化日期、时间
    NSDateFormatter *dateStr = [dateFormatter stringFromDate:date];
    NSString *message = [[NSString alloc] initWithFormat: @"您选择的日期和时间是: %@", dateStr];
    
    // 创建一个UIAlertController对象（警告框），并通过该警告框显示用户选择的日期、时间
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle: @"当前日期时间" message: message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *OKAction = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleCancel handler:nil];
    
    [alertView addAction:OKAction];
    
    [self presentViewController:alertView animated:true completion:nil];
    
}

@end
