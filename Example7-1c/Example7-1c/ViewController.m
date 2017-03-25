//
//  ViewController.m
//  Example7-1c
//
//  Created by 孙晓晔 on 2017/3/25.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

#define kPicCount 5
#define kPicWidth [UIScreen mainScreen].bounds.size.width
#define kPicHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (weak, nonatomic) IBOutlet UIButton *next;

@property(nonatomic,strong) UIScrollView * myView;
@property(nonatomic, strong) NSTimer *timer1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initPic];
    
    [self.view bringSubviewToFront:self.page];

    [self.view bringSubviewToFront:self.next];

    
    self.page.frame = CGRectMake(0, kPicHeight - 60, kPicHeight, 40);
    self.page.numberOfPages = kPicCount;
    
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(next:) userInfo:nil repeats:YES];
}



-(UIScrollView*)myView {
    if (_myView == nil) {
        _myView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _myView.backgroundColor = [UIColor redColor];
        
        _myView.contentSize = CGSizeMake(kPicCount*kPicWidth, kPicHeight);
        _myView.pagingEnabled = YES;
        
        [self.view addSubview:_myView];
    }
    
    return _myView;
}

-(void)initPic {
    
    NSString *strName;
    CGRect rect;
    for (int i = 0; i < kPicCount; i++) {
        strName = [NSString stringWithFormat:@"%d.jpg", i+1];
        
        rect = CGRectMake(kPicWidth*i, 0, kPicWidth, kPicHeight);
        UIImageView *img = [[UIImageView alloc]initWithFrame:rect];
        
        img.image = [UIImage imageNamed:strName];
        [self.myView addSubview:img];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.page.currentPage =  self.myView.contentOffset.x / kPicWidth;
}

- (IBAction)next:(UIButton *)sender {
    
    int offset = self.myView.contentOffset.x;
    
    offset += kPicWidth;
    
    if (offset >= kPicWidth*kPicCount) {
        offset = 0;
    }
    
//    self.myView.contentOffset = CGPointMake(offset, 0);
    [self.myView setContentOffset:CGPointMake(offset, 0) animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
