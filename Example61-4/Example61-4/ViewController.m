//
//  ViewController.m
//  Example61-4
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Singer.h"

#define btnWidth 80
#define btnHeight 30

@interface ViewController ()

// 保存plist文件所读取的数据
@property(nonatomic, strong)NSMutableArray *arrayAll;

@property(nonatomic, strong)UILabel *titleL; // 标题
@property(nonatomic, strong)UIImageView *imgView; // 歌手图片view
@property(nonatomic, strong)UIButton *prevBtn; // 上一张
@property(nonatomic, strong)UIButton *nextBtn; // 下一张
@property(nonatomic, assign)int iIndex; // 当前索引

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showCurrentPage:0];
}

// 延迟加载，初始化下一张按钮
-(UIButton*)nextBtn {
    if (_nextBtn == nil) {
        // 创建下一张按钮
        
        float posY = CGRectGetMaxY(self.imgView.frame) + 15;
        float posX = self.imgView.frame.origin.x + 120;
        
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(posX, posY, btnWidth, btnHeight)];
        
        [_nextBtn setTitle:@"下一张" forState:UIControlStateNormal];
        _nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        // 设置正常和高亮的背景图片
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
        [_nextBtn setBackgroundImage:[UIImage imageNamed:@"highligted"] forState:UIControlStateHighlighted];
    
        [_nextBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
        [self.view addSubview:_nextBtn];
    }
    
    return _nextBtn;
}

// 延迟加载，初始化上一张按钮
-(UIButton*)prevBtn {
    
    if (_prevBtn == nil) {
        // 创建上一张按钮
        
        float posY = CGRectGetMaxY(self.imgView.frame) + 15;
        float posX = self.imgView.frame.origin.x;
        
        _prevBtn = [[UIButton alloc] initWithFrame:CGRectMake(posX, posY, btnWidth, btnHeight)];
        
        [_prevBtn setTitle:@"上一张" forState:UIControlStateNormal];
        _prevBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        
        // 设置正常和高亮的背景图片
        [_prevBtn setBackgroundImage:[UIImage imageNamed:@"normal"] forState:UIControlStateNormal];
        [_prevBtn setBackgroundImage:[UIImage imageNamed:@"highligted"] forState:UIControlStateHighlighted];
        
        [_prevBtn addTarget:self action:@selector(prev) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_prevBtn];
    }
    
    return _prevBtn;
}

#pragma mark 上一张
-(void)prev {
    
    self.iIndex--;
    
    // 若按钮未禁用，此代码可以用于循环翻页
    if (self.iIndex < 0) {
        self.iIndex = self.arrayAll.count - 1;
    }
    
    [self showCurrentPage:self.iIndex];
}

-(void)showCurrentPage:(int)iPage {
    
    // 当前页为第一页时，禁用上一页按钮
    if (iPage == 0) {
        self.prevBtn.enabled = NO;
    } else {
        self.prevBtn.enabled = YES;
    }
    
    // 当前页为最后一页时，禁用下一页按钮
    if (iPage == self.arrayAll.count - 1) {
        self.nextBtn.enabled = NO;
    } else {
        self.nextBtn.enabled = YES;
    }
    
    Singer *singer = self.arrayAll[iPage];
    
    NSString  *strTitle = [NSString stringWithFormat:@"%@ %d/%d", singer.name, iPage+1, self.arrayAll.count];
    self.titleL.text = strTitle;
    
    self.imgView.image = [UIImage imageNamed:singer.pic];
}

#pragma mark 下一张
-(void)next {
    self.iIndex++;
    
    // 若按钮未禁用，此代码可以用于循环翻页
    if (self.iIndex >= self.arrayAll.count) {
        self.iIndex = 0;
    }
    
    [self showCurrentPage:self.iIndex];
}

// 延时加载，初始化标题
-(UILabel*)titleL {
    
    if (_titleL == nil) {
        // 创建标题
        
        float posY = CGRectGetMinY(self.imgView.frame) - 35 - 15;
        float posX = self.imgView.frame.origin.x;
        
        _titleL = [[UILabel alloc] initWithFrame:CGRectMake(posX, posY, 200, 35)];
        [_titleL setBackgroundColor:[UIColor greenColor]];
        _titleL.textAlignment = NSTextAlignmentCenter;
        
        [self.view addSubview:_titleL];
    }
    
    return _titleL;
}

// 延时加载，初始化图片View
-(UIImageView*)imgView {
    
    if (_imgView == nil) {
        // 创建图片view
        
        _imgView= [[UIImageView alloc] initWithFrame:CGRectMake(60, 100, 200, 150)];
    
        _imgView.backgroundColor = [UIColor redColor];
        _imgView.center = self.view.center;
    
        [self.view addSubview:_imgView];
    }
    
    return _imgView;
}

// 延时加载，获取plist文件数据
-(NSMutableArray*) arrayAll {
    if (_arrayAll == nil) {
        _arrayAll = [NSMutableArray array];
        
        // 读取plist文件
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
