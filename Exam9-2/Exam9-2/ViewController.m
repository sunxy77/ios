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

@property (nonatomic, strong) DownloadView *myView;
@property(nonatomic, strong) NSTimer *timer; // 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myView = [[DownloadView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    
    [self.view addSubview:self.myView];
}

// 点击开始下载
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.myView begin];
    
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
        [self.myView myDownload:progress];
    } else {
        progress = 0.05f;
        [self.timer invalidate];
        _timer = nil;
    }
    
    progress += 0.05;
}

@end
