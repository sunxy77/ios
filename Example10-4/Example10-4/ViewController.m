//
//  ViewController.m
//  Example10-4
//
//  Created by 孙晓晔 on 2017/4/9.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVPlayerViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    AVPlayerViewController
}

- (IBAction)showPlayerController:(id)sender {
    AVPlayerViewController *playerController = [[AVPlayerViewController alloc]init];
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"aa.mp4" ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:strPath];
    
    playerController.player = [AVPlayer playerWithURL:url];
    
    playerController.delegate = self;
    
    
    
    [self presentViewController:playerController animated:YES completion:^{
        [playerController.player play];
    }];
    
    
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(AVPlayerViewController *)playerViewController {
    
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
