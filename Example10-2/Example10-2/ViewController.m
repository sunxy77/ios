//
//  ViewController.m
//  Example10-2
//
//  Created by 孙晓晔 on 2017/4/9.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#define ItemStatus @"status"

@interface ViewController ()
@property(nonatomic,strong) AVPlayer *player1;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@property(nonatomic,strong) AVPlayerLayer *playLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view.layer addSublayer:self.playLayer];
    [self playLayer];
    
    [self.player1.currentItem addObserver:self forKeyPath:ItemStatus options:NSKeyValueObservingOptionNew context:nil];
    
    [self.player1.currentItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (IBAction)playcurVideo:(UISlider *)sender {
    [self.player1.currentItem seekToTime:CMTimeMake(self.slider.value, 1) completionHandler:^(BOOL finished) {
        [self.player1 play];
    }];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:ItemStatus]) {
        AVPlayerItem *item = object;
        
        if (item.status == AVPlayerItemStatusReadyToPlay) {
            
            long long  llsecond = item.duration.value / item.duration.timescale;
            
            self.slider.minimumValue = 0;
            self.slider.maximumValue = llsecond;
            
            __weak typeof (self) weakSelf = self;
            
            [self.player1 addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:NULL usingBlock:^(CMTime time) {
                weakSelf.slider.value = weakSelf.player1.currentItem.currentTime.value / weakSelf.player1.currentItem.currentTime.timescale;
            }];
            
            NSLog(@"AVPlayerItemStatusReadyToPlay");
            self.playBtn.enabled = TRUE;
        } else if(item.status == AVPlayerItemStatusFailed) {
            NSLog(@"AVPlayerItemStatusFailed");
        } else if(item.status == AVPlayerItemStatusUnknown) {
            
            NSLog(@"AVPlayerItemStatusUnknown");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        AVPlayerItem *item = object;
        
        long long  llTotalSecond = item.duration.value / item.duration.timescale;
        
        
        NSValue *value = [item.loadedTimeRanges lastObject];
        CMTimeRange range = [value CMTimeRangeValue];
        long long llsecond = range.start.value / range.start.timescale + range.duration.value / range.duration.timescale;
        
        [self.progress setProgress:((float)llsecond/llTotalSecond) animated:YES];
        
        
    }
}

-(void)dealloc {

    [self.player1.currentItem removeObserver:self forKeyPath:ItemStatus];
    [self.player1.currentItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
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
        _playLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
//        _playLayer.videoGravity = AVLayerVideoGravityResize;
        
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
