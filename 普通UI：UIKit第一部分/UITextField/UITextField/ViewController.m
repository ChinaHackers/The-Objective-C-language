//
//  ViewController.m
//  UITextField
//
//  Created by Liu Chuan on 16/7/12.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //文本框（UITextField）
    // 初始化 UItextField 对象,被设置其尺寸位置
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(10, 160, 200, 30)];
    
    //设置文本框的边框样式 : 圆角矩形
    text.borderStyle = UITextBorderStyleRoundedRect;
    
    /*
     borderStyle 属性值可以为：
     
     UITextBorderStyleNone          无边框
     UITextBorderStyleLine          直线边框
     UITextBorderStyleRoundedRect   圆角矩形边框
     UITextBorderStyleBezel         边线+阴影
     */
    
    
    // 设置文本样式
    
    // 设置文本框的提示文字
    text.placeholder = @"请输入用户名";
    
    // 设置文本框的默认值
    text.text = @"Apple";

    /*
     默认情况下，当文字超出文本框的宽度，会被隐藏一部分，如果不想文字被隐藏，希望全部显示出来，
     可以通过设置 adjustsFontSizeToFitWidth 属性来实现
     */
    text.adjustsFontSizeToFitWidth = YES;

    // 设置最新可缩小的字号
    text.minimumFontSize = 12;
    
    // 设置文本框的对齐方式
    // 用textAlignment 属性设置文字的对齐方式, 水平对齐
    
    /*
        NSTextAlignmentLeft     : 左对齐
        NSTextAlignmentRight    : 右对齐
        NSTextAlignmentCenter   : 居中对齐
    */
    text.textAlignment = NSTextAlignmentLeft;
    
    // 用 contentVerticalAlignment 属性设置文字的对齐方式, 垂直对齐
    
    /*
     UIControlContentVerticalAlignmentTop       : 向上对齐
     UIControlContentVerticalAlignmentCenter    : 垂直居中对齐
     UIControlContentVerticalAlignmentBottom    : 向下对齐
     */
    text.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    
    // 键盘设置
    // 设置文本框的 returnKeyType 属性来设置return 的样式
    
    /*
     UIReturnKeyTypeDone       : // 此时键盘的return 键盘为 Done 样式，暗示用户，点击return键后，完成输入
     UIReturnKeyTypeGo         : // 此时键盘的return 键盘为 Go 样式，暗示用户，点击return键后完成输入，并跳转到另一页.
     UIReturnKeyTypeSearch     : // 此时键盘的return 键盘为Search 样式，暗示用户，点击return键后，用刚才输入的文字作为关键字进行搜索
     UIReturnKeyTypeJoin       : // 此时键盘的return 键盘为Join 样式，暗示用户，点击return键后，会注册用户或添加数据的操作
     UIReturnKeyTypeNext       : // 此时键盘的return 键盘为Next 样式，暗示用户，点击return键后，会进行下一步
     UIReturnKeyTypeSend       : // 此时键盘的return 键盘为Search 样式，暗示用户，点击return键后，会发送数据
     
     */
    
    
    // 此时键盘的return 键盘为 Done 样式，暗示用户，点击return键后，完成输入
    text.returnKeyType = UIReturnKeyDone;
    
    // 清除按钮
    // 属性 clearButtonMode 设置清除按钮 (输入框上的小 x)
   
    /*
     UITextFieldViewModeWhileEditing    : 表示编辑时出现清除按钮
     UITextFieldViewModeUnlessEditing   : 编辑时，不出现清除按钮，完成编辑后才出现清除按钮
     UITextFieldViewModeAlways          : 一直都显示清除按钮
    */
    text.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // 设置文本框的光标颜色
    text.tintColor = [UIColor orangeColor];
    
    text.delegate = self;
    
    [self.view addSubview:text];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //收起键盘
    //textField.resignFirstResponder = YES;
    
    [textField resignFirstResponder];
    
    // 打印文本框中的值
    NSLog(@"%@", textField.text);
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
