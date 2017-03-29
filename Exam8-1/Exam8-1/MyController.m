//
//  MyController.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MyController.h"
#import "MyCell.h"

@interface MyController ()<UITableViewDataSource>

@end

@implementation MyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
}

//#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        return 60;
    }
    
    return 45;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 10;
    }
    
    return 20;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger ret = 1;
    switch (section) {
        case 0:
            ret = 1;
            break;
            
        case 1:
            ret = 4;
            break;
            
        default:
            break;
    }
    
    return ret;
}

#pragma mark - UITableViewDataSource
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @" ";
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strIndetifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndetifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIndetifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        MyCell *mycell = [[[NSBundle mainBundle] loadNibNamed:@"MyCell" owner:nil options:nil] firstObject];
        
        mycell.frame = CGRectMake(5, 5, tableView.bounds.size.width - 10, mycell.frame.size.height);
        mycell.detail.frame = CGRectMake(mycell.frame.size.width - 45, 20, 40, 40);
        
        mycell.photo.layer.cornerRadius = 8;
        mycell.photo.layer.masksToBounds = YES;
        
        [mycell setModel:@"1.jpg" name:@"张学友" account:@"微信号：zhang123"];
        
        return mycell;
    }
    
    switch (indexPath.section) {
        case 1:
            [self section_1:cell cellForRowAtIndexPath:indexPath];
            break;
            
        case 2:
            [self section_2:cell cellForRowAtIndexPath:indexPath];
            break;
            
        case 3:
            [self section_3:cell cellForRowAtIndexPath:indexPath];
            break;
            
        default:
            break;
    }
    
    return cell;
}

-(void)section_0:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    cell.textLabel.text = @"孙晓晔";
//    cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
}

-(void)section_1:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"相册";
            cell.imageView.image = [UIImage imageNamed:@"2.jpg"];
            break;
        case 1:
            cell.textLabel.text = @"收藏";
            cell.imageView.image = [UIImage imageNamed:@"3.jpg"];
            break;
        case 2:
            cell.textLabel.text = @"钱包";
            cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 3:
            cell.textLabel.text = @"卡包";
            cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
            break;
        default:
            break;
    }
}

-(void)section_2:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = @"表情";
    cell.imageView.image = [UIImage imageNamed:@"6.jpg"];
}

-(void)section_3:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = @"设置";
    cell.imageView.image = [UIImage imageNamed:@"7.jpg"];
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
