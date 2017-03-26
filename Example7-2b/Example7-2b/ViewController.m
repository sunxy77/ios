//
//  ViewController.m
//  Example7-2b
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic, strong)UITableView *myView;
@property(nonatomic, strong)UIView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self myView];
    
    self.headerView = [[UIView alloc]init];
    
    UIImageView *img = [[UIImageView alloc] init];
    img.image = [UIImage imageNamed:@"1.jpg"];
    
    [self.headerView addSubview:img];
    
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    img.frame = self.headerView.frame;
    
    self.myView.tableHeaderView = self.headerView;
}

// 有多少节
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

// 每一节有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

// 每一行显示的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    static NSString *strIndetifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndetifier];
    
    if (cell == nil) {
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIndetifier];
    } else {
        NSLog(@"cell 重用");
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"容祖儿";
                cell.detailTextLabel.text = @"春天里";
                cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                
                break;
            case 1:
                cell.textLabel.text = @"张杰";
                cell.imageView.image = [UIImage imageNamed:@"2.jpg"];
                cell.accessoryType = UITableViewCellAccessoryDetailButton;

                break;
            case 2:
                cell.textLabel.text = @"汪峰";
                cell.imageView.image = [UIImage imageNamed:@"3.jpg"];
                cell.accessoryType = UITableViewCellAccessoryCheckmark;

                break;
            case 3:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"7.jpg"];
                break;
            case 4:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"8.jpg"];
                break;
            case 5:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"9.jpg"];
                break;
                
            default:
                break;
        }
        
        
    } else {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"容祖儿1";
                cell.imageView.image = [UIImage imageNamed:@"4.jpg"];
                break;
            case 1:
                cell.textLabel.text = @"张杰2";
                cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
                
                break;
            case 2:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"6.jpg"];
                break;
            case 3:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
                break;
            case 4:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"2.jpg"];
                break;
            case 5:
                cell.textLabel.text = @"汪峰3";
                cell.imageView.image = [UIImage imageNamed:@"2.jpg"];
                break;
                
                
            default:
                break;
        }
    }
    
    return cell;
}

-(UITableView*)myView {
    if (_myView == nil) {
        CGRect frame = self.view.frame;
        CGRect rect = CGRectMake(0, 0, frame.size.width, frame.size.height*5);
        _myView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        
        [self.view addSubview:_myView];
        
        _myView.dataSource = self;
        
//        _myView.rowHeight = 60;
    }
    
    return _myView;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"大陆歌手";
    }
    
    return @"港台歌手";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
 
    if (section == 0) {
        return @"大陆歌手 end";
    }
    
    return @"港台歌手 end";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
