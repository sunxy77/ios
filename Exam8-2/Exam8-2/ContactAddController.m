//
//  ContactAddController.m
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ContactAddController.h"
#import "ContactController.h"
#import "Vcard.h"

@interface ContactAddController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (weak, nonatomic) IBOutlet UIButton *AddBtn;

@end

@implementation ContactAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ContactController *dest = segue.destinationViewController;
//    dest.navigationItem.title = [NSString stringWithFormat:@"%@联系列表",self.account.text];
    
//    dest.vcard.accessibilityActivationPoint
    
//    NSNotificationCenter *notify = [NSNotificationCenter defaultCenter];
//    
//    [notify addObserver:dest selector:@selector(printName:) name: @"messageName" object:nil];
    
}

- (IBAction)add:(UIButton *)sender {
    self.vcard.name = self.name.text;
    self.vcard.tel = self.tel.text;
    
    [self performSegueWithIdentifier:@"add2contact" sender:nil];
}


@end
