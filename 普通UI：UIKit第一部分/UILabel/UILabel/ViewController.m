//
//  ViewController.m
//  UILabel
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
    
    // 标签(UILabel)的使用
    [self UILabel_Demo];
   
}

#pragma mark 标签(UILabel)的使用
- (void)UILabel_Demo {

    // 创建 UILabel 对象
    UILabel *label = [[UILabel alloc] init];
    
    //设置 label 的 frame
    label.frame = CGRectMake(20, 100, 280, 100);
    
    // 设置 label 文字
    label.text = @"iOS SDK";
    
    // 添加到视图中
    [self.view addSubview:label];
    
    // 背景颜色、文字颜色的设置
    // 设置标签文字颜色为白色
    label.textColor = [UIColor whiteColor];
    
    // 设置标签背景颜色为紫色
    label.backgroundColor = [UIColor purpleColor];
    
    // 标签的对齐方式设置
    /*
     可以用textAlignment 属性设置文字的对齐方式。
     属性值可以为：
     NStextAlignment.Left       ->左对齐
     NStextAlignment.Center     ->居中对齐
     NSTextAlignment.Right      ->右对齐
     */
    
    // 居中对齐
    label.textAlignment = NSTextAlignmentCenter;
    
    // 文字阴影的设置
    // 文字阴影的颜色用 shadowColor 属性设置，
    // 阴影的偏移量可以用属性 shadowOffset 来指定。
    
    // 设置文字阴影颜色为 gray(灰色)
    label.shadowColor = [UIColor grayColor];
    
    // 设置阴影偏移量
    // shadowOffset 属性值，需要用到 CGSizeMake 函数来生成，
    // 函数的第一个参数表示 X 轴的偏移量，第二个参数表示 Y 轴的偏移量
    label.shadowOffset = CGSizeMake(-5, 5);
    
    
    //遍历系统所有的字体
    NSArray *familyNames = [UIFont familyNames];
    
    for (NSString *family in familyNames) {
        NSLog(@"系统的字体: %@", family);
    }
    
    // 设置标签字体
    // 通过font属性，可以设置文字的字体
    
    // 该属性值为 UIfont 对象，如果找不到定义的字体，将会使用系统默认的字体、大小。
    label.font = [UIFont boldSystemFontOfSize:60];
    
    // 标签文字的省略方式
    // 当标签的文字超过了容器的宽度时,隐藏尾部的文字,并显示省略号.
    
    // 通过 linBreakMode 属性设置省略方式
    /*
     属性值可以为:
     NSLineBreakMode.NSLineBreakByWordWrapping       按照单词换行
     NSLineBreakMode.NSLineBreakByTruncatingTail     隐藏尾部文字,并显示省略号
     NSLineBreakMode.NSLineBreakByTruncatingMiddle   隐藏中间文字,并显示省略号
     NSLineBreakMode.NSLineBreakByTruncatingHead     隐藏头部文字,并显示省略号
     NSLineBreakMode.NSLineBreakByClipping           截取多于的部分，并不显示省略号
     NSLineBreakMode.NSLineBreakByCharWrapping        按照字符换行
     
     */
    
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
    //文字的自动调整
    /*
     默认情况下，当文字超出标签的宽度，会被隐藏一部分，如果不想文字被隐藏，希望全部显示出来，
     可以通过设置 adjustsFontSizeToFitWidth 属性来实现
     */
    
    label.adjustsFontSizeToFitWidth = YES;
    
    // 多行字符串
    // 默认标签中的文字只会显示一行,如果需要显示多行文字,通过设置 numberOfLines 属性来实现
    label.numberOfLines = 2;
    
    // 设置标签中的文字行数: 0 ( 0:不限制行数 )
    // label.numberOfLines = 0;
    
}

@end
