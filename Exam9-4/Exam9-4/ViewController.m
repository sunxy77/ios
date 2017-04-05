//
//  ViewController.m
//  Exam9-4
//
//  Created by 孙晓晔 on 2017/4/2.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@property(nonatomic, strong) NSTimer *timer; // 定时器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

// 点击启动或停止演示
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(animations) userInfo:nil repeats:YES];
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}

// 定时执行，动画
-(void)animations {
    
    [self animation:self.redView animationID:@"red"];
    [self animation:self.blueView animationID:@"blue"];
    [self animation:self.greenView animationID:@"green"];
    [self animation:self.orangeView animationID:@"orange"];
}

// 动画效果
-(void)animation:(UIView*)view animationID:(NSString *)animationID {
    [UIView beginAnimations:animationID context:nil];
    
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationTransition:1 + arc4random() % 4 forView:view cache:YES];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
