//
//  ViewController.m
//  Example6-2
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Singer.h"
#import "singerView.h"

#define Ymargin 40      // view距离控制器view顶部的距离
#define viewYmargin 25  // 两个view之间的间隔
#define viewWidth 80    // view的宽度
#define viewHeight 100  // view的高度
#define column 3        // 列数

@interface ViewController ()

@property(nonatomic, strong)NSMutableArray *arrayAll; // 用于存储plist文件读取的数据

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.    
    
    // 计算每个view左右间距
    int iXmargin = (self.view.frame.size.width - viewWidth * column) / (column + 1);
    
    for (int i = 0; i < 9; i++) {
        
        if (i < self.arrayAll.count) {
            Singer *singer = self.arrayAll[i];
            
            int col = i % column; // 计算列数
            int row = i / column; // 计算行数
            
            int x = iXmargin + (viewWidth+iXmargin)*col;
            int y = Ymargin + (viewHeight + iXmargin)*row;
            
            singerView *view = [singerView templateView];
            view.frame = CGRectMake(x, y, viewWidth, viewHeight);
            
            [self.view addSubview:view];
            
            view.singer = singer;

        }
    }
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
