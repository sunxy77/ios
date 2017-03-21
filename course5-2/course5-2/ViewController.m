//
//  ViewController.m
//  course5-2
//
//  Created by 孙晓晔 on 2017/3/21.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"red view frame = %@", NSStringFromCGRect(self.redView.frame));
//    
//    NSLog(@"red view bounds = %@", NSStringFromCGRect(self.redView.bounds));
//    
//    NSLog(@"red view center = %@", NSStringFromCGPoint(self.redView.center));
//    
//    UIButton *btn = [[UIButton alloc] init];
//    
//    btn.frame = CGRectMake(0, 0, 200, 40);
//    btn.backgroundColor = [UIColor redColor];
    
//    [self.view addSubview:btn];
    
    // [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    // [btn setImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateHighlighted];
    
//    [btn setTitle:@"正常" forState:UIControlStateNormal];
//    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
    
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
    
    [img1 setImage:[UIImage imageNamed:@"1.jpg"]];
    [img1 setBackgroundColor:[UIColor blueColor]];
    img1.contentMode = UIViewContentModeScaleAspectFit;
    
    
    [self.view addSubview:img1];
    
    
    [self.mySlider addTarget:self action:@selector(slider) forControlEvents:UIControlEventValueChanged];
    
    [self.mySwitch addTarget:self action:@selector(switch1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)slider {
    self.myImage.alpha = self.mySlider.value;
}

-(void)switch1{
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
