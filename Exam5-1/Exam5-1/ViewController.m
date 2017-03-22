//
//  ViewController.m
//  Exam5-1
//
//  Created by 孙晓晔 on 2017/3/22.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *input1;
@property (weak, nonatomic) IBOutlet UITextField *input2;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.input1.keyboardType = UIKeyboardTypeNumberPad;
    self.input2.keyboardType = UIKeyboardTypeNumberPad;
}

// 根据按钮的tag值判断执行相应的算术运算
- (IBAction)calculate:(UIButton *)sender {
    
    NSString *str1 = self.input1.text;
    NSString *str2 = self.input2.text;
    
    if ([str1 isEqualToString:@""]) {
        self.resultLabel.text = @"数字1为空，请重新输入";
        return;
    }
    
    if ([str2 isEqualToString:@""]) {
        self.resultLabel.text = @"数字2为空，请重新输入";
        return;
    }
    
    float ret = 0;
    
    switch (sender.tag) {
        case 10:
            ret = [str1 floatValue] + [str2 floatValue];
            break;
        case 20:
            ret = [str1 floatValue] - [str2 floatValue];
            break;
        case 30:
            ret = [str1 floatValue] * [str2 floatValue];
            break;
        case 40:
            if ([str2 floatValue] == 0) {
                self.resultLabel.text = @"数字2为0，除数不能为0，请重新输入";
                return;
            } else {
                ret = [str1 floatValue] / [str2 floatValue];
            }
            break;
            
        default:
            break;
    }
    
    self.resultLabel.text = [NSString stringWithFormat:@"%.02f", ret];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
