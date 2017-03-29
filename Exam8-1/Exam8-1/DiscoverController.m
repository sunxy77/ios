//
//  DiscoverController.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "DiscoverController.h"

@interface DiscoverController ()<UITableViewDataSource>

@end

@implementation DiscoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
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
    if (section == 0) {
        return 1;
    }
    
    return 2;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strIndetifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndetifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIndetifier];
    } else {
        NSLog(@"cell 重用");
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
        switch (indexPath.section) {
            case 0:
                [self section_0:cell cellForRowAtIndexPath:indexPath];
                break;
                
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
    cell.textLabel.text = @"朋友圈";
    cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
}

-(void)section_1:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"扫一扫";
            cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 1:
            cell.textLabel.text = @"摇一摇";
            cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
            
        default:
            break;
    }
}

-(void)section_2:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"附近的人";
            cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 1:
            cell.textLabel.text = @"漂流瓶";
            cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
            
        default:
            break;
    }
}

-(void)section_3:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"购物";
            cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
            break;
        case 1:
            cell.textLabel.text = @"游戏";
            cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
            
        default:
            break;
    }
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
