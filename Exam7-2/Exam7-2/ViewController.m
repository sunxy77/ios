//
//  ViewController.m
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "ImageScroll.h"

#define kPicCount 4 // 图片数量
#define kPicWidth [UIScreen mainScreen].bounds.size.width // 图片宽度
#define kPicHeight [UIScreen mainScreen].bounds.size.height // Scroll视图高度

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPageControl *page; // 分页控件
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 分页控件图层置前
    [self.view bringSubviewToFront:self.page];
    
    // 创建滚动实现对象
    ImageScroll *imageScroll = [[ImageScroll alloc] init];
    
    // 创建滚动视图
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    view.contentSize = CGSizeMake((kPicCount+2)*kPicWidth, kPicHeight);
    [view setContentOffset:CGPointMake(kPicWidth, 0) animated:NO];
    
    [self.view addSubview:view];
    
    [imageScroll execute:view page:self.page];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
