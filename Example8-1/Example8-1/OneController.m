//
//  OneController.m
//  Example8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "OneController.h"
#import "TwoViewController.h"

@interface OneController ()

@end

@implementation OneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"主页";
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
- (IBAction)jump1:(id)sender {
    
    TwoViewController *two = [[TwoViewController alloc]init];
    
    [self.navigationController pushViewController:two animated:YES];
}

@end
