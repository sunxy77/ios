//
//  myTabBarController.m
//  Example8-4
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "myTabBarController.h"

@interface myTabBarController ()
@property(nonatomic,strong) UIView *tabbarBack;
@property(nonatomic,strong) UIButton *lastBtn;
@end

@implementation myTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabbarBack = [[UIView alloc] initWithFrame:self.tabBar.frame];
    self.tabbarBack.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.tabbarBack];
    
    [self.tabBar removeFromSuperview];
}

-(void)initTabBar {
    
    int width = self.tabBar.frame.size.width / self.viewControllers.count;
    
    for (int i = 0; i < self.viewControllers.count; i++) {
        CGRect rect = CGRectMake(width*i, 4, width, 40);
        UIButton *btn = [[UIButton alloc] initWithFrame:rect];
        
        NSString *str = [NSString stringWithFormat:@"tab%d", i+1];
        UIImage *img = [UIImage imageNamed:str];
        
        [btn setImage:img forState:UIControlStateNormal];
        
//        btn.titleLabel.text = [NSString stringWithFormat:@"按钮%d", i];
//        btn.tintColor = [UIColor blueColor];
        
        [self.tabbarBack addSubview:btn];
        
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = i;
    }
    
}

-(void)btn:(UIButton*)btn {
    
    [self.lastBtn setSelected:NO];
    
    [btn setSelected:YES];
    
    [self setSelectedIndex:btn.tag];
    
    self.lastBtn = btn;
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
