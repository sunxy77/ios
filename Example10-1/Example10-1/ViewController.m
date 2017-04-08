//
//  ViewController.m
//  Example10-1
//
//  Created by 孙晓晔 on 2017/4/9.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property(nonatomic,strong) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic,strong) NSTimer *timer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(updateSlider) userInfo:nil repeats:YES];
}

-(AVAudioPlayer *)player {
    if (_player == nil) {
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"我从雪山来" ofType:@"mp3"];
        
        NSURL *url = [NSURL fileURLWithPath:strPath];
        
        NSError *err;
        
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&err];
        
        [_player prepareToPlay];
    }
    
    return _player;
}

-(void)updateSlider {
    
    self.slider.value = self.player.currentTime / self.player.duration;
}
- (IBAction)play:(UIButton *)sender {
    [self.player play];
}

- (IBAction)pause:(UIButton *)sender {
    [self.player pause];
}

- (IBAction)stop:(UIButton *)sender {
    [self.player stop];
    
    self.player.currentTime = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderCurrent:(UIButton *)sender {
    
    self.player.currentTime = self.player.duration * self.slider.value;
    
}

@end
