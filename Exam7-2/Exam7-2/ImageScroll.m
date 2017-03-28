//
//  ImageScroll.m
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageScroll.h"

#define kPicWidth [UIScreen mainScreen].bounds.size.width // 图片宽度
#define kPicHeight [UIScreen mainScreen].bounds.size.height // Scroll视图高度

@interface ImageScroll()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property(nonatomic, weak) UIScrollView *myView; // 滚动视图
@property (nonatomic, weak) UIPageControl *page; // 分页控件
@property(nonatomic, strong) NSTimer *timer; // 定时器

@property (nonatomic, strong) NSArray *data; // 轮播图片数组
@property(nonatomic, assign) NSTimeInterval ti; // 定时器间隔

@end

@implementation ImageScroll

/**
 初始化
 frame 页局
 */
-(instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

/**
 data 图片数组
 ti 定时间隔
 */
-(void)execute:(NSArray*)data ti:(NSTimeInterval)ti {
    if (data == nil || data.count < 2) {
        return;
    }
    
    if (ti <= 0) {
        ti = 2.0;
    }
    
    self.data = data;
    self.ti = ti;
    
    [self createContentScrollView];
    [self createPageControlView];
    
    [self initPic];
    
    [self on_timer];
}

// 创建滚动视图
-(void)createContentScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    scrollView.contentSize = CGSizeMake((self.data.count+2)*kPicWidth, kPicHeight);
    
    // 第一张图片，第二个区块
    [scrollView setContentOffset:CGPointMake(kPicWidth, 0) animated:NO];
    
    scrollView.pagingEnabled = YES; // 支持分页
    scrollView.delegate = self; // 指定协议实现类
    
    // 添加至视图
    [self addSubview:scrollView];
    
    _myView = scrollView;
}

// 创建分页控件
-(void)createPageControlView {
    
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    
    pageControl.center = CGPointMake(self.center.x, self.bounds.size.height - 100);
    
    pageControl.pageIndicatorTintColor = [UIColor blueColor]; // 蓝色
    pageControl.currentPageIndicatorTintColor = [UIColor redColor]; // 红色
    
    // 设置PageControl控件总页数
    pageControl.numberOfPages = self.data.count;
    
    // 添加至视图
    [self addSubview:pageControl];
    
    _page = pageControl;
}

// 创建ImageView，并加载图片
-(void)initPic {
    
    [self addImage:0 pic:self.data[self.data.count-1]]; // 最后一张图片添加至第一个位置
    [self addImage:(int)self.data.count+1 pic:self.data[0]]; // 第一张图片添加至最后一个位置
    
    // 添加需要轮播的图片
    for (int i = 0; i < self.data.count; i++) {
        [self addImage:i+1 pic:self.data[i]];
    }
}

// 向滚动视图添加图片
-(void)addImage:(int)index pic:(NSString*)pic {
    CGRect rect = CGRectMake(kPicWidth*index, 0, kPicWidth, kPicHeight);
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:rect];
    
    // 按比率放缩
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    imgView.image = [UIImage imageNamed:pic];
    
    [self.myView addSubview:imgView];
}

// 拖拽中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self checkLoop];
    
    self.page.currentPage = (self.myView.contentOffset.x / kPicWidth) - 1;
}

// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self off_timer];
}

// 结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    [self on_timer];
}

// 定时器启动
-(void)on_timer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.ti target:self selector:@selector(next:) userInfo:nil repeats:YES];
}

// 定时器停止
-(void)off_timer {
    
    [self.timer invalidate];
}

// 滚动下一张
- (IBAction)next:(UIButton *)sender {
    
    int offset = self.myView.contentOffset.x;
    
    offset += kPicWidth;
    
    [self.myView setContentOffset:CGPointMake(offset, 0) animated:YES];
    
    // 判断是否跳转第一图片的实际位置
    [self checkLoop];
}

// 检测滚动至第一张或最后一张，实现循环轮播
-(void)checkLoop {
    CGFloat currentX = self.myView.contentOffset.x;
    
    if (currentX <= 0.0) {
        float offset = kPicWidth * self.data.count;
        
        [self.myView setContentOffset:CGPointMake(offset, 0) animated:NO];
    } else if (currentX >= kPicWidth * (self.data.count + 1)) {
        [self.myView setContentOffset:CGPointMake(kPicWidth, 0) animated:NO];
    }
}

@end
