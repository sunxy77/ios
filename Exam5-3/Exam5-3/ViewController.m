//
//  ViewController.m
//  Exam5-3
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *selectedBtn; // 选中按钮
@property (weak, nonatomic) IBOutlet UIButton *disabledBtn; // 禁用按钮
@property (weak, nonatomic) IBOutlet UIButton *normalBtn; // 正常按钮

@property (weak, nonatomic) IBOutlet UIButton *imageBtn; // 图片按钮

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGFloat imageViewWidth = CGRectGetWidth(self.imageBtn.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(self.imageBtn.titleLabel.frame);
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsMake(0, 0 + labelWidth, 0, 0 - labelWidth);
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsMake(0, 0 - imageViewWidth, 0, 0 + imageViewWidth);
    
    [self.imageBtn setImageEdgeInsets:imageEdgeInsets];
    [self.imageBtn setTitleEdgeInsets:titleEdgeInsets];
}

- (IBAction)done:(UIButton *)sender {
    
    self.imageBtn.selected = NO;
    self.imageBtn.enabled = YES;
    
    switch (sender.tag) {
        case 10: // 选中
            
            self.imageBtn.selected = YES;
            
            self.selectedBtn.enabled = NO;
            
            break;
        case 20: // 禁用
            
            [self.imageBtn setTitle:@"禁用" forState:UIControlStateDisabled];
            self.disabledBtn.enabled = NO;
            self.normalBtn.enabled = YES;
            
            self.imageBtn.enabled = NO;
            break;
        case 30: // 正常
            self.imageBtn.enabled = YES;
            [self.imageBtn setTitle:@"正常" forState:UIControlStateNormal];
            
            self.selectedBtn.enabled = YES;
            self.disabledBtn.enabled = YES;
            self.normalBtn.enabled = NO;
            
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
