//
//  WeixinController.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "WeixinController.h"
#import "Message.h"
#import "MessageCell.h"

@interface WeixinController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong) UITableView *myView; //
@property(nonatomic,copy)NSArray *messages; // 存放plist读取的数据
@end

@implementation WeixinController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self myView];
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

// 懒加载
-(NSArray*)messages {
    if (_messages == nil) {
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"msg.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
        
        NSMutableArray *muArr = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            Message *obj = [Message messageWithDict:dict];
            
            [muArr addObject:obj];
        }
        
        _messages = muArr;
    }
    
    return _messages;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *strIdentifier = @"mycell";
    
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MessageCell" owner:nil options:nil] firstObject];
        
        cell.frame = CGRectMake(8, 8, tableView.bounds.size.width - 16, cell.frame.size.height);
        cell.msg.frame = CGRectMake(72, 38, tableView.bounds.size.width - 75, cell.msg.frame.size.height);
        cell.pic.layer.cornerRadius = 8;
        cell.pic.layer.masksToBounds = YES;
        
        cell.model = self.messages[indexPath.row];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
