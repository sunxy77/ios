//
//  ViewController.m
//  Exam5-4
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建UIImageView对象
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 30, 200, 120)];
    
    // 指定图片
    [image1 setImage: [UIImage imageNamed:@"2.jpg"]];
    
    // 设置背景颜色
    [image1 setBackgroundColor:[UIColor blueColor]];
    
    // 设置图片显示模式
    image1.contentMode = UIViewContentModeScaleAspectFit;
    
    // 添加至视图
    [self.view addSubview:image1];
}

// 滑动条控件操作实现
- (IBAction)slider:(UISlider *)sender {
    
    // 通过改变滑动条控件的值设置imageView图片的透明度
    
    self.myImage.alpha = self.mySlider.value / 100;
}

// 开关控件操作实现
- (IBAction)switchAction:(id)sender {
    
    if (self.mySwitch.isOn) {
        self.mySlider.enabled = YES;
    } else {
        self.mySlider.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
