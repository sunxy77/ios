//
//  ViewController.m
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

#define kPicCount 6 // 图片数量
#define kPicWidth [UIScreen mainScreen].bounds.size.width // 图片宽度
#define kPicHeight [UIScreen mainScreen].bounds.size.height // Scroll视图高度

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *page; // 分页控件

@property(nonatomic,strong) UIScrollView * myView; // 滚动视图
@property(nonatomic, strong) NSTimer *timer1; // 定时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initPic];
    
    // 分页控件图层置前
    [self.view bringSubviewToFront:self.page];
    
    // 设置PageControl控件总页数
    self.page.numberOfPages = kPicCount;
    
    // self.page.currentPage = 0;
    [self.myView setContentOffset:CGPointMake(kPicWidth, 0) animated:NO];
    
    // 启用定时器
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(next:) userInfo:nil repeats:YES];
}

// 懒加载
-(UIScrollView*)myView {
    if (_myView == nil) {
        _myView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        
        _myView.contentSize = CGSizeMake((kPicCount+2)*kPicWidth, kPicHeight);
        _myView.pagingEnabled = YES;
        
        [self.view addSubview:_myView];
        
        _myView.delegate = self;
    }
    
    return _myView;
}

// 创建ImageView，并加载图片
-(void)initPic {
    
    [self addImage:0 name:kPicCount]; // 最后一张图片添加至第一个位置
    [self addImage:kPicCount+1 name:1]; // 第一张图片添加至最后一个位置
    
    // 添加需要轮播的图片
    for (int i = 1; i <= kPicCount; i++) {
        [self addImage:i name:i];
    }
}

// 向Scroll视图添加图片
-(void)addImage:(int)index name:(int)name {
    
    NSString *strName = [NSString stringWithFormat:@"%d.jpg", name];
    
    CGRect rect = CGRectMake(kPicWidth*index, 0, kPicWidth, kPicHeight);
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:rect];
    
    // 按比率放缩
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    imgView.image = [UIImage imageNamed:strName];
    
    [self.myView addSubview:imgView];
}

// 拖拽中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self checkLoop];
    
    self.page.currentPage = (self.myView.contentOffset.x / kPicWidth) - 1;
}

// 开始拖拽，定时器停止
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.timer1 setFireDate:[NSDate distantFuture]];
}

// 结束拖拽，定时器启动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    [self.timer1 setFireDate:[NSDate dateWithTimeInterval:1.5 sinceDate:[NSDate date]]];
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
    
    if (currentX == 0.0) {
        float offset = kPicWidth * kPicCount;
        
        [self.myView setContentOffset:CGPointMake(offset, 0) animated:NO];
    } else if (currentX == kPicWidth * (kPicCount + 1)) {
        [self.myView setContentOffset:CGPointMake(kPicWidth, 0) animated:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
