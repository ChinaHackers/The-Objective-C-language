//
//  ViewController.m
//  UILabelDemo
//
//  Created by Liu Chuan on 16/6/8.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

// 定义 ViewController 的扩展
@interface ViewController ()

// 定义一个属性来记录所有动态添加的UILabel控件
@property (nonatomic, strong) NSMutableArray *labels;

@end

@implementation ViewController

// 定义一个变量来记录下一个要添加的UILabel的位置 (y 轴)
int nextY = 80;


 // 重写该方法，当该控制器关联的视图加载完成后，系统会调用该方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"nib文件加载完成！！");
    
    // 设置view的背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化labels数组
    self.labels = [NSMutableArray array];
    
    
    // 创建 UIButtonTypeRoundedRect (圆角按钮)类型的UIButton对象
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 设置addButton的大小、位置
    addButton.frame = CGRectMake(30, 30, 60, 40);
    
    
    // 为UIButton设置按钮文本    //按钮默认模式显示 “添加”
    [addButton setTitle:@"添加" forState: UIControlStateNormal];
    
    // 为UIButton的 Touch Up Inside 事件绑定事件处理方法
    [addButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建UIButtonTypeRoundedRect (圆角按钮)类型的UIButton对象
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    // 设置removeButton的大小、位置
    removeButton.frame = CGRectMake(230, 30, 60, 40);
    
    // 为UIButton设置按钮文本。 //按钮默认模式显示“删除”
    [removeButton setTitle:@"删除" forState:UIControlStateNormal];
    
    
    // 为removeButton的Touch Up Inside 事件绑定事件处理方法
    [removeButton addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加按钮到视图中
    [self.view addSubview:addButton];
    [self.view addSubview:removeButton];
    [super viewDidLoad];
    
    
}


// 添加
- (void)add:(id)sender{
    
    // 创建一个UILabel控件
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, nextY, 160, 30)];
    
    // 设置UILabel显示的文本
    label.text = @"疯狂的ios讲义";
    
    // 设置 UIlabel 文本颜色
    label.textColor = [UIColor orangeColor];
    
    // 设置 UIlabel 文本阴影
    label.shadowColor = [UIColor grayColor];
    
    // 设置阴影偏移量
    label.shadowOffset = CGSizeMake(2, 2);
    
    // 将该UILabel控件添加到labels数组中
    [self.labels addObject:label];
    
    // 将该UILabel控件添加到view父控件中
    [self.view addSubview:label];
    
    
    // 控制nextY的值加 50
    nextY += 50;
    
    
}

// 删除
- (void)remove:(id)sender {
    
    // 如果labels数组中元素的个数 大于0，表示有UILabel 可删除
    if ([self.labels count] > 0)
    {
        // 如果最后一个UILabel从界面上删除
        [[self.labels lastObject] removeFromSuperview];
        
        // 从labels数组中删除最后一个元素
        [self.labels removeLastObject];
        
        // 控制nextY的值减 50
        nextY -= 50;
        
    }
}


@end
