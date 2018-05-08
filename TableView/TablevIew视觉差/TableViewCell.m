//
//  TableViewCell.m
//  TablevIew视觉差
//
//  Created by 舒通 on 2018/5/3.
//  Copyright © 2018年 舒通. All rights reserved.
//

#import "TableViewCell.h"

static NSString *const TableViewCellID = @"TableViewCellID";

@implementation TableViewCell

+ (instancetype)preperCellFormXib:(UITableView *)tableView
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imgView.contentMode = UIViewContentModeCenter;
    self.clipsToBounds = YES;
}

#pragma mark  < private method > -- shutong
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view
{
    //获取到cell的位置 转换到 view的frame
    CGRect rect = [tableView convertRect:self.frame toView:view];
    
    //获取到cell最小Y距离中心点的距离
    float cellDistance = CGRectGetHeight(view.frame) / 2 - CGRectGetMinY(rect);
    
    //获取到imgView比cell高度 多出来的高度
    float moreHeight = CGRectGetHeight(self.imgView.frame) - CGRectGetHeight(self.frame);
    
    //获取到距离中心点和视图的比例 * 相差高度得到移动距离
    float imageMove = (cellDistance / CGRectGetHeight(view.frame)) * moreHeight;
    
    //旧的图片Frame
    CGRect imageRect = self.imgView.frame;
    
    //移动
    imageRect.origin.y = imageMove - (moreHeight/2);
    
    //新的图片Frame
    self.imgView.frame = imageRect;
    
    
}

@end
