//
//  ViewController.m
//  Example7-1
//
//  Created by 孙晓晔 on 2017/3/25.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *myview;
@property(nonatomic,strong)UIImage *img;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    view.backgroundColor = [UIColor yellowColor];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1920, 1080)];
    
    img.image = [UIImage imageNamed:@"3.jpg"];
    [view addSubview:img];
    
    self.img = img;
    
    [self.view addSubview:view];
    
    view.contentSize = CGSizeMake(1920, 1080);
    
    view.contentOffset = CGPointMake(1920 - 320, 1080 - 568);
    
    view.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
    view.delegate = self;
    
    // 通过手势缩放图片
    view.minimumZoomScale = 0.1;
    view.maximumZoomScale = 5;
    
    
    
    self.myview = view;
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.img;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSString *str = NSStringFromCGPoint(self.myview.contentOffset);
    
    NSLog(@"拖拽中 %@", str);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    NSString *str = NSStringFromCGPoint(self.myview.contentOffset);
    
    NSLog(@"开始拖拽 %@", str);
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    NSString *str = NSStringFromCGPoint(self.myview.contentOffset);
    
    NSLog(@"结束拖拽 %@", str);
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSString *str = NSStringFromCGPoint(self.myview.contentOffset);
    
    NSLog(@"开始减速 %@", str);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSString *str = NSStringFromCGPoint(self.myview.contentOffset);
    
    NSLog(@"结束减速 %@", str);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
