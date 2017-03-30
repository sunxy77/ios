//
//  VcardCell.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "VcardCell.h"

@implementation VcardCell

-(void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView setFrame:CGRectMake(8, 8, 44, 44)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.textLabel setFrame:CGRectMake(70, 8, 100, 44)];
    
    [self setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    
    [self setLayoutMargins:UIEdgeInsetsZero];
}

@end
