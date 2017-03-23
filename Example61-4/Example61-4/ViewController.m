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
    
//    self.arrayAll;
    
    Singer *singer = self.arrayAll[0];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 200, 40)];
    
    [titleLabel setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:titleLabel];
    
    NSString  *strTitle = [NSString stringWithFormat:@"%@ %d/%d", singer.name, 1, self.arrayAll.count];
    titleLabel.text = strTitle;
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleL = titleLabel;
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, 200, 150)];
    
    imgView.backgroundColor = [UIColor redColor];
    imgView.center = self.view.center;
    
    [self.view addSubview:imgView];
    self.imgView = imgView;
    
    imgView.image = [UIImage imageNamed:singer.pic];
    
    
    UIButton *prevBtn = [[UIButton alloc] initWithFrame:CGRectMake(60, 400, 100, 40)];
    prevBtn.backgroundColor = [UIColor grayColor];
    
    [prevBtn setTitle:@"上一张" forState:UIControlStateNormal];
    
    [prevBtn addTarget:self action:@selector(prev) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:prevBtn];
    self.prevBtn = prevBtn;
    
    UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 100, 40)];
    nextBtn.backgroundColor = [UIColor grayColor];
    
    [nextBtn setTitle:@"下一张" forState:UIControlStateNormal];
    
    [nextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextBtn];
    self.nextBtn = nextBtn;
    
}

#pragma mark 上一张
-(void)prev {
    
    self.iIndex--;
    
    if (self.iIndex < 0) {
        self.iIndex = self.arrayAll.count - 1;
    }
    
    Singer *singer = self.arrayAll[self.iIndex];
    
    NSString  *strTitle = [NSString stringWithFormat:@"%@ %d/%d", singer.name, self.iIndex+1, self.arrayAll.count];
    self.titleL.text = strTitle;
    
    self.imgView.image = [UIImage imageNamed:singer.pic];
    
}

#pragma mark 下一张
-(void)next {
    self.iIndex++;
    
    if (self.iIndex >= self.arrayAll.count) {
        self.iIndex = 0;
    }
    
    Singer *singer = self.arrayAll[self.iIndex];
    
    NSString  *strTitle = [NSString stringWithFormat:@"%@ %d/%d", singer.name, self.iIndex+1, self.arrayAll.count];
    self.titleL.text = strTitle;
    
    self.imgView.image = [UIImage imageNamed:singer.pic];
    
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
