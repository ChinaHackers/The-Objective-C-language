//
//  ViewController.m
//  UITableViewDemo
//
//  Created by Liu Chuan on 16/7/13.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 创建一个可变数组, 作为表格数据的来源
NSMutableArray *_month;

UITableView *table;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化可变数组
    _month = [[NSMutableArray alloc] initWithObjects:@"一月：January", @"二月：February", @"三月：March", @"四月：April",
              @"五月：May", @"六月：June", @"七月：July", @"八月：August" ,@"九月：September",
              @"十月：October", @"十一月：November" ,@"十二月：December", nil];
    
    
    // 初始化表格视图对象, 设置表格视图的显示区域, 设置表格视图的风格
    // UITableViewStylePlain    : 普通风格
    // UITableViewStyleGrouped  : 分组风格
    table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    // 设置表格视图的代理\数据源为当前类本身
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
    
}

// MARK - tableView Data scource

// MARK -  设置表格的组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

// MARK -  设置表格每组的行数
// 必须要实现的函数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _month.count;
}

// MARK - 每一行显示的具体内容
// 初始化\表格视图单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建一个字符串,作为重用表格视图的复用标识符
    NSString *identifier = @"cell";
    
    // 获取可重用的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // 如果没有可重用的单元格,就创建一个单元格
    if (cell == nil) {
        
        // 创建单元格, 并设置单元格的样式, 单元格的复用标识符
        /*
         //设置 UITableViewCell的style：
         (1）UITableViewCellStyleDefault  ：默认的，只有一个常规内容标签和一个可选的UIImageView
         (2）UITableViewCellStyleValue1   ：内容标签在左，详细标签在右，右边是蓝色或灰色的文本
         (3）UITableViewCellStyleValue2   ：同Value1位置相同，左边是蓝色文本
         (4）UITableViewCellStyleSubtitle ：标签上下放置
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        // 获取单元格的行
        NSInteger rowNo = [indexPath row];
        
        // 设置单元格的标题文本
        cell.textLabel.text = [_month objectAtIndex:rowNo];
        
        // 设置单元格的描述文字
        cell.detailTextLabel.text = [_month objectAtIndex:rowNo];
        
        
        /*
         // 设置cell右边辅助按钮的样式
         
         UITableViewCellAccessoryNone                      :    // 不显示任何附属视图
         UITableViewCellAccessoryDisclosureIndicator       :    // 信息 > 按钮
         UITableViewCellAccessoryDetailDisclosureButton    :    // 详细信息 加上 > 按钮
         UITableViewCellAccessoryCheckmark                 :    // 复选标记
         UITableViewCellAccessoryDetailButton              :    // 详细按钮
         
         */
        
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
    }
    
    
    return  cell;
}

// MARK: - 该方法的返回值决定某行是否可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}


/***********  MARK: - UITableView  Delegate ************/

//设置编辑的样式: 进入编辑模式的cell是删除还是增加
/*
 注意：这个方法里一般返回两种类型，还有一中默认类型
 删除：UITableViewCellEditingStyleDelete
 增加：UITableViewCellEditingStyleInsert
 */

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}


//MARK: - 修改删除按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
}

// MARK: -  开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:

// 响应单元格的删除事件：当点击delete后执行的删除过程
// 注意：先除数据源里的数据，删除tableView中对应的行
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 如果编辑模式为删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // 获取待删除的单元格, 在段落中的行数.
        NSUInteger rowNumber = [indexPath row];
        
        // 从数组中将该单元格的内容清除, 以保证 单元格的一致性
        [_month removeObjectAtIndex:rowNumber];
        
        //再删除tableView指定的表格行 , 具有动画效果
        [tableView deleteRowsAtIndexPaths: [NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    NSLog(@"你点击了删除按钮!");
}


//MARK: - 处理列表项的选中事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *itemString = _month[[indexPath row]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:itemString preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

// 设置表格视图单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

// 设置表格视图的每组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"月份";
}

// 设置表格视图的头部标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 60;
}
// 设置表格视图的每组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return @"一年中的月份";
}
// 设置表格视图的尾部标题的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 30;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
