//
//  ViewController.m
//  UITableView_Group
//
//  Created by Liu Chuan on 2016/12/14.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

// MARK: - 遵守 UITableView 代理\数据源协议
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong ,nonatomic) NSDictionary *data;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // MARK: - 加载 plist 文件
    _data = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Property" withExtension:@"plist"]];
    
    _table.delegate = self;
    _table.dataSource = self;
    
}
    



// MARK: - UItableView Data Source

// MARK: 设置TableView 的分区数, 此方法默认1组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _data.count;
}


// MARK: 设置每个分区有多少行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_data.allValues[section] count];
    
    
}

// MARK: 设置每一行显示的具体内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // 定义一个循环标识, 为了提供表格显示性能，已创建完成的单元需重复使用
    static NSString *ID = @"cell";
    
    // 从缓存池中取出可循环利用cell    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    UILabel *title = [cell viewWithTag:1];
    
    title.text = [_data.allValues[indexPath.section] objectAtIndex:indexPath.row];
    
    return cell;
 
}

 //MARK: 该方法的返回值, 决定指定分区 - 头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return _data.allKeys[section];
}

//MARK: 设置分组标题内容高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}

//告诉表部分对应部分标题/索引(例如“B”,1))
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index  {

    
    return 1;
    
    
}

//返回部分的章节标题显示列表索引视图(例如“ABCD…Z #”)
//- (NSString *)sectionIndexTitlesForTableView:(UITableView *)tableView  {
//    
//    return @"1", @"2";
//    
//}


@end
