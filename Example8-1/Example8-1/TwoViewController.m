//
//  TwoViewController.m
//  Example8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"第二页";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"定制" style:UIBarButtonItemStylePlain target:self action:@selector(abc)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(ccc)];
}

- (void)abc {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)ccc {
    ThreeViewController *three = [[ThreeViewController alloc]init];
    
    [self.navigationController pushViewController:three animated:YES];
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
- (IBAction)jump2:(id)sender {
    
    ThreeViewController *three = [[ThreeViewController alloc]init];
    
    [self.navigationController pushViewController:three animated:NO];
}

@end
