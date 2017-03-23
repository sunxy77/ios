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
    
    NSLog(@"--------------blueView-----------------");
    NSLog(@"blueView frame = %@", NSStringFromCGRect(self.blueView.frame));
    NSLog(@"blueView bounds = %@", NSStringFromCGRect(self.blueView.bounds));
    NSLog(@"blueView center = %@", NSStringFromCGPoint(self.blueView.center));
    
    NSLog(@"--------------greenView-----------------");
    NSLog(@"greenView frame = %@", NSStringFromCGRect(self.greenView.frame));
    NSLog(@"greenView bounds = %@", NSStringFromCGRect(self.greenView.bounds));
    NSLog(@"greenView center = %@", NSStringFromCGPoint(self.greenView.center));
    
    NSLog(@"--------------blackView-----------------");
    NSLog(@"blackView frame = %@", NSStringFromCGRect(self.blackView.frame));
    NSLog(@"blackView bounds = %@", NSStringFromCGRect(self.blackView.bounds));
    NSLog(@"blackView center = %@", NSStringFromCGPoint(self.blackView.center));
    
    NSLog(@"--------------whiteView-----------------");
    NSLog(@"whiteView frame = %@", NSStringFromCGRect(self.whiteView.frame));
    NSLog(@"whiteView bounds = %@", NSStringFromCGRect(self.whiteView.bounds));
    NSLog(@"whiteView center = %@", NSStringFromCGPoint(self.whiteView.center));
    
    NSLog(@"--------------redView-----------------");
    NSLog(@"redView frame = %@", NSStringFromCGRect(self.redView.frame));
    NSLog(@"redView bounds = %@", NSStringFromCGRect(self.redView.bounds));
    NSLog(@"redView center = %@", NSStringFromCGPoint(self.redView.center));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
