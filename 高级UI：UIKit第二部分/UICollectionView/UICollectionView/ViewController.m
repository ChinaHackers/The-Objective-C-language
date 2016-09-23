//
//  ViewController.m
//  UICollectionView
//
//  Created by Liu Chuan on 16/7/19.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 创建一个数组, 作为集合视图的数据来源
NSArray *images;

// 创建单元格标识符
NSString *identify = @"cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // =============================
    // UICollectionView (网格控制器)
    // =============================
    
    
    // 初始化数组
    images = [NSArray arrayWithObjects:@"lxm1.JPG", @"lxm2.JPG", @"lxm3.JPG", @"lxm4.JPG", @"lxm5.JPG", @"lxm6.JPG", @"lxm7.JPG", @"lxm8.JPG", @"lxm9.JPG", @"lxm10.JPG", @"lxm11.JPG", nil];
    
    /*
     UICollectionView 的layout 属性: 支持 Flow\ Custom 2中布局方式
     
     UICollectionViewFlowLayout: 指定 UICollectionView 布局方式支持横排\纵排 -> 网格
    */
    
    // 创建 UICollectionViewFlowLayout 布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    // 创建 UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: layout];
    
    // 设置 UICollectionView 布局方向
    /*
        UICollectionViewScrollDirectionHorizontal      : 水平
        UICollectionViewScrollDirectionVertical        : 垂直
     */
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置 collectionView 单元格的 宽度, 高度
    layout.itemSize = CGSizeMake(80, 80);
    
    // 设置 collectionView 单元格之间的最小 行间距
    layout.minimumLineSpacing = 5;
    
    // 设置 collectionView 单元格之间的最小 列间距
    layout.minimumInteritemSpacing = 5;
    
    // 设置 UIcollectionView 的代理\数据源协议
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    
    // 注册cell的类型和重用标示符
    [collectionView registerClass: UICollectionViewCell.self forCellWithReuseIdentifier: identify];
    
    // 设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:collectionView];
    
    
}

//=================================
//MARK: - UICollectionView Delegate
//=================================

// 一共有多少组数据
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

// 设置 集合视图单元格的数量
// 每一组有多少条数据
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return images.count;
}


// 初始化\返回集合视图的单元格
// 每一行 cell 的显示具体内容



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // 创建单元格重用标识符
    NSString *str = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:str forIndexPath:indexPath];
    
    // 取出每个item所需要的数据
    // 根据表格编号, 从数组中获得对应的图像名称
 
    for (int i = 1; i < 12; i++) {
        
        UIImage *image = [UIImage imageNamed: [NSString stringWithFormat:@"lxm%d.JPG", i]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        // 设置图像视图默认为半透明
        imageView.layer.opacity = 0.5;
        
        [self.view addSubview:imageView];
        
        [collectionView addSubview:imageView];
    }
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
