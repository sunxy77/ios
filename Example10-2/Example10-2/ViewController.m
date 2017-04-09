//
//  ViewController.m
//  Example10-2
//
//  Created by 孙晓晔 on 2017/4/9.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property(nonatomic,strong) AVPlayer *player1;
@property(nonatomic,strong) AVPlayerLayer *playLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view.layer addSublayer:self.playLayer];
    [self playLayer];
}


-(AVPlayer *)player1 {
    
    if (_player1 == nil) {
        
        // NSString *strPath = [[NSBundle mainBundle] pathForResource:@"金色家园" ofType:@"mp3"];
        
//        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"aa.mov" ofType:@"mp4"];
//        NSURL *url = [NSURL fileURLWithPath:strPath];
        
        NSURL *url = [NSURL URLWithString:@"http://dl.jiapuwang.net/22.mov"];
        
        _player1 = [AVPlayer playerWithURL:url];
        
//        [_player1 pre]
    }
    
    return _player1;
}

-(AVPlayerLayer *)playLayer {
    if (_playLayer == nil) {
        _playLayer = [AVPlayerLayer playerLayerWithPlayer:self.player1];
        
        _playLayer.backgroundColor = [UIColor redColor].CGColor;
        _playLayer.bounds = CGRectMake(0, 0, 320, 240);
        
        _playLayer.anchorPoint = CGPointMake(0, 0);
        _playLayer.position = CGPointMake(0, 200);
//        _playLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _playLayer.videoGravity = AVLayerVideoGravityResize;
        
        [self.view.layer addSublayer:_playLayer];
        
    }
    
    return _playLayer;
}
- (IBAction)play:(id)sender {
    [self.player1 play];
}
- (IBAction)pause:(id)sender {
    [self.player1 pause];
}

- (IBAction)stop:(id)sender {
    self.player1.rate = 0;
    
//    [self.player1.currentItem seekToTime:kCMTimeZero];
    [self.player1.currentItem seekToTime:CMTimeMake(0, 1)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
