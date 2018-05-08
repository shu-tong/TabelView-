//
//  ViewController.m
//  TablevIew视觉差
//
//  Created by 舒通 on 2018/5/3.
//  Copyright © 2018年 舒通. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self loadData];
    self.view.backgroundColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

#pragma mark  < load data > -- shutong
- (void)loadData
{
    for (int i = 0; i < 2; i ++) {
      [self.dataSource addObjectsFromArray:@[@"image1.jpeg",@"image2.jpeg",@"image3.jpeg",@"image4.jpeg"]];
    }
    [self.tableView reloadData];
}

#pragma mark  < createUI > -- shutong
- (void)createUI
{
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark  < tableView data > -- shutong
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [TableViewCell preperCellFormXib:tableView];
    cell.imgView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    
    return cell;
}

#pragma mark  < tableview delegate > -- shutong
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}
#pragma mark  < scrollview delegate > -- shutong
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取可视 cell
    NSArray *visibleCells = [self.tableView visibleCells];
    for (int i = 0; i < visibleCells.count; i ++) {
        if ([visibleCells[i] isKindOfClass:[TableViewCell class]]) {//如果是特定的cell类型才做处理
            TableViewCell *cell = visibleCells[i];
            [cell cellOnTableView:self.tableView didScrollView:self.view];
        }
    }
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:[UIScrollView new]];
}
#pragma mark  < setter / getter > -- shutong
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self; //这里用到delegate 主要是为了调用scrollview的代理方法
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
