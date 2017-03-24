//
//  ViewController.m
//  Example633
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
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view2];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *arrH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[view1]-50-[view2(==view1)]-50-|" options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:nil views:@{@"view1":view1, @"view2":view2}];

    [self.view addConstraints:arrH];
    
    NSArray *arrV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[view1]-50-|" options:0 metrics:nil views:@{@"view1":view1}];
    
    [self.view addConstraints:arrV];
}

- (void)aa {
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:view1];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *constraintLeft = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    
    [self.view addConstraint:constraintLeft];
    
    NSLayoutConstraint *constraintTop = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    
    [self.view addConstraint:constraintTop];
    
    NSLayoutConstraint *constraintRight = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:0.8 constant:0];
    
    [self.view addConstraint:constraintRight];
    
    
    NSLayoutConstraint *constraintBottom = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    
    [self.view addConstraint:constraintBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
