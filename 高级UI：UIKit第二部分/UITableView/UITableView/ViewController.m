//
//  ViewController.m
//  UITableView
//
//  Created by Liu Chuan on 16/6/29.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

// 定义一个数组,作为表格控件的数据来源
NSMutableArray *dataArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏背景色
//    [self.navigationController.navigationBar.barTintColor] = [UIColor redColor]
    
     // 修改导航栏 文字 大小 \ 颜色
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
      
    
    //初始化数据，这一次数据，我们放在属性列表文件里
    //读取plist文件路径, 将plist内容放到 Array 中
//    ctrlnames = NSArray(contentsOfFile: Bundle.main.path(forResource: "Property", ofType: "plist")!) as? Array
  
    dataArray = [NSMutableArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"Property" ofType:@"plist"]];

    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 设置表格视图的代理\数据源协议 为当前视图控制器类
    self.table.delegate = self;
    self.table.dataSource = self;
}

//MARK: - UItableView Data Source

// MARK: 每个分区有多少行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [dataArray count];
 
}

// MARK: 每一行显示的具体内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 定义一个循环标识, 为了提供表格显示性能，已创建完成的单元需重复使用
    NSString *str = @"cell";
    
    //初始化cell并指定其类型，也可自定义cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    // 如果单元格为 nil
    if (cell == nil) {
/*
//设置 UITableViewCell的style：
         (1）UITableViewCellStyleDefault：     默认的，只有一个常规内容标签和一个可选的UIImageView
        （2）UITableViewCellStyleValue1：      内容标签在左，详细标签在右，右边是蓝色或灰色的文本
        （3）UITableViewCellStyleValue2：      同Value1位置相同，左边是蓝色文本
        （4）UITableViewCellStyleSubtitle：    标签上下放置
*/
        // 创建 UItableViewCell 对象
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    NSInteger rowNo = [indexPath row];
    
    // 设置textLabel显示的文本
    cell.textLabel.text = [dataArray objectAtIndex:rowNo];
    
    // 设置详细说明显示的文本
    cell.detailTextLabel.text = [dataArray objectAtIndex:rowNo];

/*
 // 设置cell右边辅助按钮的样式
 
 UITableViewCellAccessoryNone                      :    // 不显示任何附属视图
 UITableViewCellAccessoryDisclosureIndicator       :    // 信息 > 按钮
 UITableViewCellAccessoryDetailDisclosureButton    :    // 详细信息 加上 > 按钮
 UITableViewCellAccessoryCheckmark                 :    // 复选标记
 UITableViewCellAccessoryDetailButton              :    // 详细按钮

 */
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    return cell;
    
    
}
//MARK: - UItableView Delegate

//MARK: 开启编辑模式
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;

}

//MARK: 设置单元格的编辑模式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 设置编辑模式为删除
    return UITableViewCellEditingStyleDelete;
}

// MARK: 响应单元格的删除事件

// 开启在Cell中滑动删除, 显示删除按钮，必须实现以下方法:
// 点击当点击delete后执行的删除过程

// 注意：先除数据源里的数据，删除tableView中对应的行

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 如果编辑模式为 删除模式, 则执行以下代码
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSLog(@"正在删除数据.....");
        
        // 获取待删除的单元格, 在段落中的行数.
        NSInteger index = [indexPath row];
        
        // 从数组中将该单元格的内容清除, 以保证 单元格 的一致性
        [dataArray removeObjectAtIndex:index];
        
    }
    // 然后删除单元格在表格中指定的行, 删除时带动画效果
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]  withRowAnimation:UITableViewRowAnimationAutomatic];
}

// 设置删除按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
}

@end
