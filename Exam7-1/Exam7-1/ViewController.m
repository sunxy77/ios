//
//  ViewController.m
//  Exam7-1
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "MeiTuan.h"
#import "MeiTuanCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *myView; //
@property(nonatomic,copy)NSArray *meituanArray; // 存放plist读取的数据
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self myView];
    // [self meituanArray];
}

// 懒加载
-(NSArray*)meituanArray {
    if (_meituanArray == nil) {
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"meituan.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
        
        NSMutableArray *muArr = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            MeiTuan *obj = [MeiTuan meiTuanWithDict:dict];
            
            [muArr addObject:obj];
        }
        
        _meituanArray = muArr;
    }
    
    return _meituanArray;
}

// 懒加载
-(UITableView*)myView {
    
    if (_myView == nil) {
        
        _myView = [[UITableView alloc] initWithFrame:self.view.frame];
        
        _myView.dataSource = self;
        _myView.delegate = self;
        
        [self.view addSubview:_myView];
    }
    
    return _myView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"你点击了%ld节%ld行",indexPath.section, indexPath.row);
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

// 设置多少节
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 设置多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.meituanArray.count;
}

//设置单元格，并加载数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strIdentifier = @"mycell";
    MeiTuanCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell == nil) {
        
        // 创建Cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MeiTuanCell" owner:nil options:nil] firstObject];
        
        cell.model = self.meituanArray[indexPath.row];
    }
    
    return cell;
}

// 隐藏状态条
-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
