//
//  ViewController.m
//  Example6-2
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Singer.h"

#define Ymargin 40  // view距离控制器view顶部的距离
#define viewYmargin 25  // 两个view之间的间隔
#define viewWidth 80    // view的宽度
#define viewHeight 100 // view的高度
#define column 3 // 列数

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *arrayAll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self arrayAll];
    
    
    
    int iXmargin = (self.view.frame.size.width - viewWidth * column) / (column + 1);
    
    for (int i = 0; i < 9; i++) {
        
        if (i < self.arrayAll.count) {
            Singer *singer = self.arrayAll[i];
            
            int col = i % column;
            int row = i / column;
            
            int x = iXmargin + (viewWidth+iXmargin)*col;
            int y = Ymargin + (viewHeight + iXmargin)*row;
            
            NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"singer" owner:nil options:nil];
            
            UIView *viewFromXib = [arr firstObject];
            
            viewFromXib.frame = CGRectMake(x, y, viewWidth, viewHeight);
            
            [self.view addSubview:viewFromXib];
            
//            UIImageView *img = viewFromXib.subviews[0];
            UIImageView *img = [viewFromXib viewWithTag:10];
            
            img.image = [UIImage imageNamed:singer.pic];
            
            
//            UILabel *label = viewFromXib.subviews[1];
            UILabel *label = [viewFromXib viewWithTag:20];
            label.text = singer.songname;
            
//            UIButton *btn = viewFromXib.subviews[2];
            UIButton *btn = [viewFromXib viewWithTag:30];
            [btn addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
            
            
//            [self addSubControl:viewFromXib singer:singer];
        }
        
    }
    
}

-(void) bb {
    int iXmargin = (self.view.frame.size.width - viewWidth * column) / (column + 1);
    
    for (int i = 0; i < 9; i++) {
        
        if (i < self.arrayAll.count) {
            Singer *singer = self.arrayAll[i];
            
            int col = i % column;
            int row = i / column;
            
            int x = iXmargin + (viewWidth+iXmargin)*col;
            int y = Ymargin + (viewHeight + iXmargin)*row;
            
            UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
            // view2.backgroundColor = [UIColor redColor];
            
            [self.view addSubview:view2];
            
            [self addSubControl:view2 singer:singer];
        }
        
    }
}

- (void)addSubControl:(UIView*)uiview singer:(Singer*)singer {
    
    CGRect cgP = uiview.bounds;
    
    UIImageView  *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cgP.size.width, 50)];
//    imgView.backgroundColor = [UIColor blueColor];
    
    imgView.image = [UIImage imageNamed:singer.pic];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    [uiview addSubview:imgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, cgP.size.width, 20)];
    // label.backgroundColor = [UIColor orangeColor];
    label.text = singer.songname;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:13];
    
    [uiview addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, cgP.size.width, 20)];
    
    // btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
    
    [btn setBackgroundImage:[UIImage imageNamed:@"highlighted"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
    
    [uiview addSubview:btn];
    
    
}

-(void)download:(UIButton*)btn {
    
    btn.enabled = NO;
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 400, 200, 40)];
    tipLabel.backgroundColor = [UIColor grayColor];
    tipLabel.text = @"下载完成";
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:tipLabel];
    
    tipLabel.alpha = 1;
    
    [UIView animateWithDuration:2.0 animations:^ {
        tipLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [tipLabel removeFromSuperview];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSMutableArray*) arrayAll {
    if (_arrayAll == nil) {
        _arrayAll = [NSMutableArray array];
        
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"singer.plist" ofType:nil];
        
        NSArray *array = [NSArray arrayWithContentsOfFile:strPath];
        
        for (NSDictionary *dict in array) {
            Singer *singer = [Singer singerWithDict:dict];
            [_arrayAll addObject:singer];
        }
    }
    
    return _arrayAll;
}

@end
