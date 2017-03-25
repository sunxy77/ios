//
//  ViewController.m
//  Example6-1b
//
//  Created by 孙晓晔 on 2017/3/25.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "download.h"

@interface ViewController ()<downloadDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    download *d1 = [[download alloc]init];
    // d1.delegate = self;
    d1.myNoticeBlock = ^(){
        NSLog(@"收到下载结果。");
    };
    
    [d1 downloadFile:@"12.mp3"];
}

-(void)downloadFinish {
    NSLog(@"收到下载结果。");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
