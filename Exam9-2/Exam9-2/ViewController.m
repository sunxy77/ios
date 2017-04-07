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

@property (nonatomic, strong) DownloadView *view1;
@property (nonatomic, strong) DownloadView *view2;
@property(nonatomic, strong) NSTimer *timer; // 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view1 = [[DownloadView alloc] initWithFrame:CGRectMake(100, 100, 100, 100) logo:@"logo"];
    
    [self.view addSubview:self.view1];
    
    self.view2 = [[DownloadView alloc] initWithFrame:CGRectMake(100, 300, 100, 100) logo:@"logo2"];
    
    [self.view addSubview:self.view2];
}

// 点击开始下载
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view1 begin];
    
    [self.view2 begin];
    
    if (_timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(download) userInfo:nil repeats:YES];
    } else {
        [_timer invalidate];
        _timer = nil;
    }
}

//  定时器调用方法
-(void)download {
    
    static CGFloat progress = 0.05;
    
    if (progress <= 1.05) {
        [self.view1 myDownload:progress];
        [self.view2 myDownload:progress];
    } else {
        progress = 0.05f;
        [self.timer invalidate];
        _timer = nil;
    }
    
    progress += 0.05;
}

@end
