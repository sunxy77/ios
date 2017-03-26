//
//  ViewController.m
//  Example7-2c
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "weixinCell.h"
#import "Friend.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *myView;
@property(nonatomic,copy)NSArray *friendArray;

@end

@implementation ViewController


/**
 1 创建uitableview
 2 自定义 cell
 3 动态加载数据
 
 *
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myView];
    
//    [self friendArray];
}


-(NSArray*)friendArray {
    if (_friendArray == nil) {
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"friend.plist" ofType:nil];
        
        NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
        
        NSMutableArray *arr2 = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            Friend *friend = [Friend friendWithDict:dict];
            
            [arr2 addObject:friend];
        }
        
        _friendArray = arr2;
    }
    
    return _friendArray;
}

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
    
    NSLog(@"你点击了%d节%d行",indexPath.section, indexPath.row);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strIdentifier = @"mycell";
    weixinCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"weixinCell" owner:nil options:nil] firstObject];
        
        cell.model = self.friendArray[indexPath.row];
        // cell.icon.image = [UIImage imageNamed:@"1.jpg"];
    }
    
    return cell;
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
