//
//  ViewController.m
//  Exam6-4
//
//  Created by 孙晓晔 on 2017/3/24.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建一个红色的View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:redView];
    
    // 创建一个蓝色的View
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    
    [redView addSubview:blueView];
    
    // 创建一个绿色的View
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:greenView];
    
    // 禁用 autoresizing功能
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置红色View的横向排列，并设置红色View与绿色View的宽度相同
    NSArray *arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view1]-20-[view2(==view1)]-20-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"view1":redView, @"view2":greenView}];
    
    [self.view addConstraints:arrH];
    
    // 设置红色View的纵向排列
    NSArray *arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[view]" options:0 metrics:nil views:@{@"view":redView}];
    
    [self.view addConstraints:arrV];
    
    // 红，高度
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200.0f];
    [self.view addConstraint:redHeight];

    // 蓝，顶
    NSArray *arrBlueH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"view":blueView}];
    
    [redView addConstraints:arrBlueH];
    
    // 蓝，左
    NSArray *arrBlueV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]" options:0 metrics:nil views:@{@"view":blueView}];
    
    [redView addConstraints:arrBlueV];
    
    // 蓝，宽度
    NSLayoutConstraint *blueWidth = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0];
    [redView addConstraint:blueWidth];
    
    // 蓝，高度
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:0];
    [redView addConstraint:blueHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
