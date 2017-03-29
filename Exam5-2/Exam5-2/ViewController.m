//
//  ViewController.m
//  Exam5-2
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *blackView;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self myPrint:self.blueView name:@"blue view"];
    [self myPrint:self.greenView name:@"green view"];
    [self myPrint:self.blackView name:@"black view"];
    [self myPrint:self.whiteView name:@"white view"];
    [self myPrint:self.redView name:@"red view"];
}

-(void)myPrint:(UIView*)view name:(NSString*)name {
    
    NSLog(@"--------------%@-----------------", name);
    NSLog(@"%@ frame = %@", name, NSStringFromCGRect(self.view.frame));
    NSLog(@"%@ bounds = %@", name, NSStringFromCGRect(self.view.bounds));
    NSLog(@"%@ center = %@", name, NSStringFromCGPoint(self.view.center));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
