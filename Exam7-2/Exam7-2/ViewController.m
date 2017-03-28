//
//  ViewController.m
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "ImageScroll.h"

#define kPicCount 6 // 图片数量

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSArray *arr;
    
//    NSArray *arr = [[NSArray alloc] initWithObjects:@"1.jpg", @"4.jpg", @"6.jpg", nil];
//    NSArray *arr = [[NSArray alloc] initWithObjects:@"1.jpg", @"6.jpg", nil];
    
    NSArray *arr = [self createArray];
    
    // 创建滚动实现对象
    ImageScroll *myview = [[ImageScroll alloc] initWithFrame:self.view.bounds data:arr ti:2.0];
    
    if (myview) {
        [self.view addSubview:myview];
    }
    
}

-(NSArray*)createArray {
    NSMutableArray *muArr = [NSMutableArray array];
    
    for (int i = 1; i <= kPicCount; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpg", i];
        
        [muArr addObject:strName];
    }
    
    return muArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
