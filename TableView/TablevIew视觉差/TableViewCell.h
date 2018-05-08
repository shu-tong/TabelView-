//
//  TableViewCell.h
//  TablevIew视觉差
//
//  Created by 舒通 on 2018/5/3.
//  Copyright © 2018年 舒通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imgView;

/**
 创建XIBcell

 @param tableView tableView description
 @return return value description
 */
+ (instancetype)preperCellFormXib:(UITableView *)tableView;


/**
 改变imgView的frame

 @param tableView tableView description
 @param view view description
 */
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view;

@end
