//
//  ViewController.m
//  Exam9-3
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "PlayerView.h"

@interface ViewController ()
@property(nonatomic,strong) PlayerView *player;
@property (nonatomic, strong) IBOutlet UIButton *playBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _player = [[[NSBundle mainBundle] loadNibNamed:@"player" owner:nil options:nil] firstObject];
    
    _player.frame = CGRectMake(0, 515, 375, 160);
    
    [self addButtonPlay];
}

-(void)addButtonPlay {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(300, 485, 60, 60)];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"ic_play_white"] forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor blueColor];
    btn.layer.cornerRadius = 30.0f;
    
    [btn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    self.playBtn = btn;
}

- (void)stop {
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
    
    [self.playBtn.layer addAnimation:an2 forKey:nil];
}

- (IBAction)play:(UIButton *)sender {
    
    CAKeyframeAnimation *an1 = [[CAKeyframeAnimation alloc]init];
    
    an1.keyPath = @"position";
    an1.fillMode = kCAFillModeForwards;
    
//    an1.removedOnCompletion = NO;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(300, 485)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(290, 535)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(280, 560)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(185, 580)];
    
    an1.values = @[v1, v2, v3, v4];
    
    NSNumber *n1 = [NSNumber numberWithFloat:0.1];
    NSNumber *n2 = [NSNumber numberWithFloat:0.2];
    NSNumber *n3 = [NSNumber numberWithFloat:0.8];
    NSNumber *n4 = [NSNumber numberWithFloat:0.9];
    
    an1.keyTimes = @[n1, n2, n3, n4];
    
    [self.playBtn.layer addAnimation:an1 forKey:nil];
    
//    [self.playBtn removeFromSuperview];
    
    [self.view addSubview:_player];
    
    CABasicAnimation *an2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    
    an2.duration = 0.5;
    
    an2.fromValue = [NSNumber numberWithFloat:0.0];
    an2.toValue = [NSNumber numberWithFloat:1.0];
    
    an2.fillMode = kCAFillModeForwards;
    
    [_player.layer setCornerRadius:100.0f];
    
    [_player.layer addAnimation:an2 forKey:nil];
    
    [_player.stopBtn addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
