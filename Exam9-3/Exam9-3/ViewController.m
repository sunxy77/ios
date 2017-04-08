//
//  ViewController.m
//  Exam9-3
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "PlayerView.h"

@interface ViewController ()<CAAnimationDelegate>
@property(nonatomic,strong) PlayerView *player;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property(nonatomic, strong) UIView *view2;

@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property(nonatomic,strong) CAShapeLayer *arcLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _player = [[[NSBundle mainBundle] loadNibNamed:@"player" owner:nil options:nil] firstObject];
    
    CGRect rect = CGRectMake(0, 515, 375, 150);
//    _player.frame = CGRectMake(0, 515, 375, 160);
    _player.frame = rect;
    _player.alpha = 0;
    
    self.playBtn.backgroundColor = [UIColor colorWithRed:66./255 green:172./255 blue:214./255 alpha:1];
    self.playBtn.layer.cornerRadius = 30.f;
    [self.player.stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_player];
//    [self.view sendSubviewToBack:_player];
    
    
    
    [self drawRoundView];
    
    self.view2.alpha = 0.f;
    
    [self.view bringSubviewToFront:self.image1];
    [self.view bringSubviewToFront:self.playBtn];
    
//    [self addButtonPlay];
    
//    CGPoint center = CGPointMake(375./2, 590);
}

- (IBAction)play:(UIButton *)sender {
    
//    CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"position"];
//    
//    a1.byValue = [NSValue valueWithCGPoint:CGPointMake(375./2 - 30 - 300, 75)];
//    a1.removedOnCompletion = NO;
//    a1.fillMode = kCAFillModeForwards;
//    
//    a1.duration = 2.f;
//    
//    [self.playBtn.layer addAnimation:a1 forKey:nil];
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDuration:1.f];
    
    [UIView setAnimationWillStartSelector:@selector(play_start)];
    [UIView setAnimationDidStopSelector:@selector(play_stop)];
    
    self.playBtn.center = CGPointMake(375./2, 515 + 75);
    
    
    [UIView commitAnimations];
}

-(void)play_start {
    
}

-(void)play_stop {
    self.playBtn.alpha = 0.f;
    self.view2.alpha = 1.f;
    
    [UIView animateWithDuration:2.f animations:^{
        self.view2.transform = CGAffineTransformScale(self.view2.transform, 7, 7);
    } completion:^(BOOL finished) {
//        self.view2.alpha = 0.f;
//        self.player.alpha = 1.f;
        
        [self play8];
    }];
    
    
}

-(void) play8 {
    self.view1.alpha = 0.f;
    
    [self.view bringSubviewToFront:self.player];
    [UIView animateWithDuration:2.f animations:^{
        self.player.alpha = 1.f;
    } completion:^(BOOL finished) {
//        self.view2.alpha = 0.f;
        //        self.player.alpha = 1.f;
        
        
    }];
}


-(void)play222 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:7.0];
    
    animation.delegate = self;
    
    animation.duration = 1.f;
    //    animation.removedOnCompletion = NO;
    
    [self.arcLayer addAnimation:animation forKey:nil];
}

-(void)play333 {
    CAKeyframeAnimation *an1 = [self a1];
    
    CABasicAnimation *an2 = [self a2];
    
    //    CABasicAnimation *an3 = [self a3];
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:an1, an2, nil];
    
    //    animGroup.repeatCount = 10;
    animGroup.duration = 1.3f;
    
    //        animGroup.removedOnCompletion = NO;
    
    //    [self.playBtn.layer addAnimation:animGroup forKey:nil];
}

- (void)drawRoundView {
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 515, 375, 150)];
    
    [self.view addSubview:view2];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:CGPointMake(375./2, 150./2) radius:30 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *arcLayer = [CAShapeLayer layer];
    arcLayer.path = path.CGPath;
    
    //arcLayer.strokeColor可设置画笔颜色
    
//    arcLayer.strokeColor = [UIColor redColor].CGColor;
//    arcLayer.lineWidth = 10;
    arcLayer.frame = view2.bounds;
    
//    arcLayer.frame = self.view.bounds;
    
    self.view2 = view2;
    
    
    UIColor *c1 = [UIColor colorWithRed:66./255 green:172./255 blue:214./255 alpha:1];
    arcLayer.fillColor = c1.CGColor;
    
    self.arcLayer = arcLayer;
    
    [view2.layer addSublayer:arcLayer];
}

-(void)start2 {
//    self.playBtn.center = CGPointMake(375/2, 595);
//    [self.playBtn setBackgroundImage:nil forState:(UIControlStateNormal)];
    
    NSLog(@"start2");
}

-(void)stop2 {
    NSLog(@"stop2");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"touches began");
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:7.0];
    
    animation.delegate = self;
    
    animation.duration = 1.f;
    //    animation.removedOnCompletion = NO;
    
    [self.arcLayer addAnimation:animation forKey:nil];
    
//    _player.alpha = 1.f;
//    _player.bounds = CGRectMake(0, 0, 60, 60);
    
    
    
    
//    [UIView beginAnimations:@"animation" context:nil];
////    [UIView setAnimationDuration:3];
//    
//    [UIView setAnimationWillStartSelector:@selector(start2)];
//    [UIView setAnimationDidStopSelector:@selector(stop2)];
//    
////    44
////    45 //    ..... 动画效果
////    46     imageView.alpha = 0.5;
////    47     imageView.bounds = CGRectMake(0, 0, 100, 100);
////    48     imageView.center = CGPointMake(50, 200);
////    49 //    imageView.frame = CGRectMake(100, 100, 100, 100);
////    
////    [UIView setAnimationRepeatCount:5];
//
////    _player.layer.cornerRadius = 100.f;
////    _player.bounds = CGRectMake(0, 0, 60, 60);
////    _player.bounds = CGRectMake(0, 0, 375, 160);
////    _player.center = CGPointMake(50, 200);
//    
//     self.playBtn.bounds = CGRectMake(0, 0, 375, 375);
//    
//    [UIView commitAnimations];
    
    
    
//    _player.alpha = 1.f;
//    
//    CABasicAnimation *an1 = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    
////    CGRect rect = CGRectMake(0, 0, 60, 60);
//    CGRect rect = CGRectMake(0, 515, 375, 160);
//    
//    an1.toValue = [NSValue valueWithCGRect:rect];
//    
//    an1.duration = 1.f;
//    an1.removedOnCompletion = NO;
//    
//    [_player.layer addAnimation:an1 forKey:nil];
}



-(void)addButtonPlay {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(300, 485, 60, 60)];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"ic_play_white"] forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor blueColor];
    btn.layer.cornerRadius = 30.0f;
    
    [btn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
//    self.playBtn = btn;
}

- (void)stop {
    NSLog(@"stop 275");
}


-(void)stop444 {
    NSLog(@"view controller stop...");
    
    CABasicAnimation *an1 = [CABasicAnimation animationWithKeyPath:@"bounds"];
    
    an1.duration = 0.5;
    
    an1.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 375, 160)];
    an1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    
    an1.removedOnCompletion = YES;
    an1.fillMode = kCAFillModeForwards;
    
    [_player.layer setCornerRadius:100.0f];
    [_player.layer addAnimation:an1 forKey:nil];
    //    [_player removeFromSuperview];
    
    [self addButtonPlay];
    
    CABasicAnimation *an2 = [CABasicAnimation animationWithKeyPath:@"position"];
    
    an2.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 580)];
    an2.toValue = [NSValue valueWithCGPoint:CGPointMake(330,515)];
    an2.fillMode = kCAFillModeForwards;
    
    an2.removedOnCompletion = NO;
    
    //    [self.playBtn.layer addAnimation:an2 forKey:nil];
}

-(CAKeyframeAnimation*)a1 {
    CGFloat x = 300;
    CGFloat y = 485;
    
    CAKeyframeAnimation *an1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    an1.fillMode = kCAFillModeForwards;
    
    //        an1.removedOnCompletion = NO;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(x, y)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(x+100, y+40)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(x+60, y+60)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(x+20, y+80)];
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(x-20, y+90)];
    NSValue *v6 = [NSValue valueWithCGPoint:CGPointMake(x-60, y+100)];
    NSValue *v7 = [NSValue valueWithCGPoint:CGPointMake(x-110, y+100)];
    
    an1.values = @[v1, v2, v3, v4, v5, v6, v7];
    an1.duration = 0.8f;
    
    return an1;
}

-(CABasicAnimation*) a2 {
    CABasicAnimation *an2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    
    // 缩放倍数
    an2.fromValue = [NSNumber numberWithFloat:0.5]; // 开始时的倍率
    an2.toValue = [NSNumber numberWithFloat:8]; // 结束时的倍率
    
    return an2;
}

-(CABasicAnimation*)a3 {
    CABasicAnimation *ret = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    ret.fromValue=[NSNumber numberWithFloat:1.0];
    ret.toValue=[NSNumber numberWithFloat:0.];
    
    return ret;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
