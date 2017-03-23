//
//  ViewController.m
//  Example6-2
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Singer.h"

#define Ymargin 40
#define viewWidth 80
#define viewHeight 100

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *arrayAll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self arrayAll];
    
    int iXmargin = (self.view.frame.size.width - viewWidth * 3) / 4;
    
    for (int i = 0; i < 9; i++) {
        
        if (i < self.arrayAll.count) {
            Singer *singer = self.arrayAll[i];
            
            int col = i % 3;
            int row = i / 3;
            
            UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(iXmargin + (viewWidth+iXmargin)*col, Ymargin + (viewHeight + iXmargin)*row, viewWidth, viewHeight)];
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
    
    [btn addTarget:self action:@selector(download) forControlEvents:UIControlEventTouchUpInside];
    
    [uiview addSubview:btn];
    
    
}

-(void)download {
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
