//
//  VcardCell.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "VcardCell.h"

@implementation VcardCell

#pragma mark - UIView
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 图片定位
    [self.imageView setFrame:CGRectMake(8, 8, 44, 44)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 文本标签定位
    [self.textLabel setFrame:CGRectMake(70, 8, 100, 44)];
    
    // 下划线边距设置
    [self setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    
    [self setLayoutMargins:UIEdgeInsetsZero];
}

@end
