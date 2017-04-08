//
//  ViewController.m
//  Exam9-3
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *view1; // 底部视图
@property (weak, nonatomic) IBOutlet UIView *view3; // 底部子视图

@property(nonatomic, strong) UIView *view2; // 辅助圆视图
@property(nonatomic,strong) CAShapeLayer *arcLayer; // 辅助视图圆庶罩

@property (weak, nonatomic) IBOutlet UIButton *playBtn; // 播放按钮
@property (weak, nonatomic) IBOutlet UIImageView *image1; // 中间图片
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 播放按钮背景色及圆角
    self.playBtn.backgroundColor = [UIColor colorWithRed:66./255 green:172./255 blue:214./255 alpha:1];
    self.playBtn.layer.cornerRadius = 30.f;
   
    // 隐藏正在播放视图
    self.view3.alpha = 0.f;
    
    // 创建辅助视图
    [self createView2];
    
    [self.view bringSubviewToFront:self.image1];
    [self.view bringSubviewToFront:self.playBtn];
}

// 点击播放按钮
- (IBAction)play:(UIButton *)sender {
    CGFloat x = 300;
    CGFloat y = 485;
    
    CAKeyframeAnimation *an1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    an1.delegate = self;
    an1.fillMode = kCAFillModeForwards;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(x+100, y+40)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(x+60, y+60)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(x+20, y+80)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(x-20, y+90)];
    NSValue *v6 = [NSValue valueWithCGPoint:CGPointMake(x-60, y+100)];
    NSValue *v7 = [NSValue valueWithCGPoint:CGPointMake(x-110, y+100)];
    
    an1.values = @[v1, v2, v3, v4, v5, v6, v7];
    an1.duration = 0.8f;
    
    [self.playBtn.layer addAnimation:an1 forKey:nil];
}

// 播放停止后操作
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.playBtn.alpha = 0.f;
    self.view2.alpha = 1.f;
    
    [UIView animateWithDuration:1.f animations:^{
        self.view2.transform = CGAffineTransformScale(self.view2.transform, 8, 8);
    } completion:^(BOOL finished) {
        
        [self play_view];
    }];
}

// 点击停止按钮
- (IBAction)stop:(UIButton *)sender {
    
    self.view3.alpha = 0.f;
    self.view2.alpha = 1;
    
    [self.view bringSubviewToFront:self.view2];
    [self.view bringSubviewToFront:self.image1];
    
    [UIView animateWithDuration:2.f animations:^{
         self.view2.transform = CGAffineTransformScale(self.view2.transform, 0.125, 0.125);
        
    } completion:^(BOOL finished) {
        self.view2.alpha = 0.f;
        self.playBtn.alpha = 1.f;
        [self.view bringSubviewToFront:self.playBtn];
        
        [self play_reset];
    }];
}

// 播放按钮复位
-(void)play_reset {
    
    [UIView animateWithDuration:1.f animations:^{
        self.playBtn.center = CGPointMake(330, 515);
    } completion:^(BOOL finished) {
        
    }];
}

// 显示正在播放视图
-(void) play_view {
    
    [self.view bringSubviewToFront:self.view1];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.view3.alpha = 1.f;
    } completion:^(BOOL finished) {
        
    }];
}

// 创建辅助视图
- (void)createView2 {
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 515, 375, 150)];
    
    [self.view addSubview:view2];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(375./2, 150./2) radius:30 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *arcLayer = [CAShapeLayer layer];
    arcLayer.path = path.CGPath;
    
    arcLayer.frame = view2.bounds;
    
    self.view2 = view2;
    
    UIColor *c1 = [UIColor colorWithRed:66./255 green:172./255 blue:214./255 alpha:1];
    arcLayer.fillColor = c1.CGColor;
    
    self.arcLayer = arcLayer;
    
    [view2.layer addSublayer:arcLayer];
    
    self.view2.alpha = 0.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
