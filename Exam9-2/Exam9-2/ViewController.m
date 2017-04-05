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

@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (nonatomic, strong) DownloadView *myView;
@property(nonatomic, strong) NSTimer *timer; // 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myImage.layer.cornerRadius = 20.f;
    self.myImage.layer.masksToBounds = YES;
    
    _myView = [[DownloadView alloc]initWithFrame:CGRectMake(20, 20, 110, 110)];
    
    _myView.alpha = 0.f;
    
    [_myImage addSubview:_myView];
}

// 点击开始下载
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (_timer == nil) {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(download) userInfo:nil repeats:YES];
    } else {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  定时器调用方法
-(void)download {
    
    static CGFloat progress = M_PI / 6;
    
    progress += M_PI / 6;
    
    NSLog(@"%f", progress);
    
    if (progress < M_PI*2) {
        [self.myView myDownload:progress];
    } else {
        [self.timer invalidate];
    }
}

@end
