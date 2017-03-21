//
//  ViewController.m
//  calculator
//
//  Created by 孙晓晔 on 2017/3/21.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextField *input2;

@property (weak, nonatomic) IBOutlet UIButton *add;
@property (weak, nonatomic) IBOutlet UIButton *sub;
@property (weak, nonatomic) IBOutlet UIButton *mul;
@property (weak, nonatomic) IBOutlet UIButton *div;
@property (weak, nonatomic) IBOutlet UILabel *result;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.add addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sub addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mul addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.div addTarget:self action:@selector(calc:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)calc:(UIButton*)btn {
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    float ret = 0;
    if ([btn.titleLabel.text isEqualToString:@"+"]) {
        ret = [str1 floatValue] + [str2 floatValue];
    } else if ([btn.titleLabel.text isEqualToString:@"-"]) {
        ret = [str1 floatValue] - [str2 floatValue];
    } else if ([btn.titleLabel.text isEqualToString:@"*"]) {
        ret = [str1 floatValue] * [str2 floatValue];
    } else if ([btn.titleLabel.text isEqualToString:@"/"]) {
        ret = [str1 floatValue] / [str2 floatValue];
    }
    
    self.result.text = [NSString stringWithFormat:@"%.02f", ret];
}

-(void)add1 {
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    float ret = [str1 floatValue] + [str2 floatValue];
    
    self.result.text = [NSString stringWithFormat:@"%.02f", ret];
}

-(void)sub1 {
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    float ret = [str1 floatValue] - [str2 floatValue];
    
    self.result.text = [NSString stringWithFormat:@"%.02f", ret];
}

-(void)mul1 {
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    float ret = [str1 floatValue] * [str2 floatValue];
    
    self.result.text = [NSString stringWithFormat:@"%.02f", ret];
}

-(void)div1 {
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    float ret = [str1 floatValue] / [str2 floatValue];
    
    self.result.text = [NSString stringWithFormat:@"%.02f", ret];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
