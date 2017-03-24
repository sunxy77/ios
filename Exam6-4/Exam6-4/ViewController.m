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
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 设置红色View的横向排列，并设置红色View与绿色View的宽度相同
    NSArray *arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[view1]-20-[view3(==view1)]-20-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"view1":redView, @"view3":greenView}];
    
    [self.view addConstraints:arrH];
    
    // 设置红色View的纵向排列
    NSArray *arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[view1]-|" options:0 metrics:nil views:@{@"view1":redView}];
    
    [self.view addConstraints:arrV];
    
    // 设置红色View的高度
    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200.0f];
    [self.view addConstraint:c1];

    arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view2]-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"view2":blueView}];
    
    [redView addConstraints:arrH];
    
    arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view2]-|" options:0 metrics:nil views:@{@"view2":blueView}];
    
    [redView addConstraints:arrV];
    
    // 设置蓝色View宽度为红色View一半，并添加至红色View中
    NSLayoutConstraint *c2 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:0.5f constant:0];
    [redView addConstraint:c2];
    
    // 设置蓝色View高度为红色View一半，并添加至红色View中
    NSLayoutConstraint *c3 = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeHeight multiplier:0.5f constant:0];
    [redView addConstraint:c3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
