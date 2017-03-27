//
//  ViewController.m
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

#define kPicCount 6
#define kPicWidth [UIScreen mainScreen].bounds.size.width
#define kPicHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *page;

@property(nonatomic,strong) UIScrollView * myView;
@property(nonatomic, strong) NSTimer *timer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initPic];
    
    //
    [self.view bringSubviewToFront:self.page];
    
    // 设置PageControl控件总页数
    self.page.numberOfPages = kPicCount;
    
    // 启用定时器
    // self.timer1 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(next:) userInfo:nil repeats:YES];
}

// 懒加载
-(UIScrollView*)myView {
    if (_myView == nil) {
        _myView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        
        _myView.contentSize = CGSizeMake(kPicCount*kPicWidth, kPicHeight);
        _myView.pagingEnabled = YES;
        
        [self.view addSubview:_myView];
        
        _myView.delegate = self;
    }
    
    return _myView;
}

// 创建ImageView，并加载图片
-(void)initPic {
    
    NSString *strName;
    CGRect rect;
    for (int i = 0; i < kPicCount; i++) {
        strName = [NSString stringWithFormat:@"%d.jpg", i+1];
        
        rect = CGRectMake(kPicWidth*i, 0, kPicWidth, kPicHeight);
        UIImageView *img = [[UIImageView alloc]initWithFrame:rect];
        
        // 按比率放缩
        img.contentMode = UIViewContentModeScaleAspectFit;
        
        img.image = [UIImage imageNamed:strName];
        [self.myView addSubview:img];
    }
}

// 拖拽中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.myView.contentOffset.x < 0) {
        float offset = kPicWidth * (kPicCount - 1);
        
        [self.myView setContentOffset:CGPointMake(offset, 0) animated:YES];
    }
    
    self.page.currentPage = self.myView.contentOffset.x / kPicWidth;
    
    NSString *str = NSStringFromCGPoint(self.myView.contentOffset);
    
    NSLog(@"拖拽中 %@", str);
}

// 开始拖拽，定时器停止
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
//    [self.timer1 invalidate];
}

// 结束拖拽，定时器启动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    // self.timer1 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(next:) userInfo:nil repeats:YES];
}

// 滚动下一张
- (IBAction)next:(UIButton *)sender {
    
    int offset = self.myView.contentOffset.x;
    
    offset += kPicWidth;
    
    if (offset >= kPicWidth*kPicCount) {
        offset = 0;
    }
    
    [self.myView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
