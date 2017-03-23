//
//  ViewController.m
//  Example61-4
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Singer.h"

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *arrayAll;

@property(nonatomic, strong)UILabel *titleL;
@property(nonatomic, strong)UIImageView *imgView;
@property(nonatomic, strong)UIButton *prevBtn;
@property(nonatomic, strong)UIButton *nextBtn;
@property(nonatomic, assign)int iIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showCurrentPage:0];
}

-(UIButton*)nextBtn {
    if (_nextBtn == nil) {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 380, 100, 40)];
        _nextBtn.backgroundColor = [UIColor blueColor];
    
        [_nextBtn setTitle:@"下一张" forState:UIControlStateNormal];
    
        [_nextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
        [self.view addSubview:_nextBtn];
    }
    
    return _nextBtn;
}

-(UIButton*)prevBtn {
    
    if (_prevBtn == nil) {
        _prevBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 380, 100, 40)];
        _prevBtn.backgroundColor = [UIColor blueColor];
        
        [_prevBtn setTitle:@"上一张" forState:UIControlStateNormal];
        
        [_prevBtn addTarget:self action:@selector(prev) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_prevBtn];
    }
    
    return _prevBtn;
   
}

#pragma mark 上一张
-(void)prev {
    
    self.iIndex--;
    
    if (self.iIndex < 0) {
        self.iIndex = self.arrayAll.count - 1;
    }
    
    [self showCurrentPage:self.iIndex];
}

-(void)showCurrentPage:(int)iPage {
    
    if (iPage == 0) {
        self.prevBtn.backgroundColor = [UIColor grayColor];
        self.prevBtn.enabled = NO;
    } else {
        self.prevBtn.backgroundColor = [UIColor blueColor];
        self.prevBtn.enabled = YES;
    }
    
    
    if (iPage == self.arrayAll.count - 1) {
        self.nextBtn.enabled = NO;
        self.nextBtn.backgroundColor = [UIColor grayColor];
    } else {
        self.nextBtn.enabled = YES;
        self.nextBtn.backgroundColor = [UIColor blueColor];
    }
    
    
    Singer *singer = self.arrayAll[iPage];
    
    NSString  *strTitle = [NSString stringWithFormat:@"%@ %d/%d", singer.name, iPage+1, self.arrayAll.count];
    self.titleL.text = strTitle;
    
    self.imgView.image = [UIImage imageNamed:singer.pic];
    
    
    
    
}
#pragma mark 下一张
-(void)next {
    self.iIndex++;
    
    if (self.iIndex >= self.arrayAll.count) {
        self.iIndex = 0;
    }
    
    [self showCurrentPage:self.iIndex];
}

-(UILabel*)titleL {
    
    if (_titleL == nil) {
    
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 200, 40)];
        [_titleL setBackgroundColor:[UIColor greenColor]];
        _titleL.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_titleL];
    }
    
    return _titleL;
}

-(UIImageView*)imgView {
    
    if (_imgView == nil) {
    
        _imgView= [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, 200, 150)];
    
        _imgView.backgroundColor = [UIColor redColor];
        _imgView.center = self.view.center;
    
        [self.view addSubview:_imgView];
        
    }
    
    return _imgView;
}

-(NSMutableArray*) arrayAll {
    if (!_arrayAll) {
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
