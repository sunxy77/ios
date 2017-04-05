//
//  ViewController.m
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "DownloadView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DownloadView *myView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property(nonatomic, strong) NSTimer *timer; // 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(download) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  定时器调用方法
-(void)download {
    
    if (self.myView.angle < M_PI*2) {
        [self.myView download];
    } else {
        [self.timer invalidate];
        self.statusLabel.text = @"下载完成";
    }
}

@end
