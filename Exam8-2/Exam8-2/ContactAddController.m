//
//  ContactAddController.m
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ContactAddController.h"
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
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//}

- (IBAction)add:(UIButton *)sender {
    self.vcard.name = self.name.text;
    self.vcard.tel = self.tel.text;
    
    //1.关闭当前视图控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    //代理传值
    if ([self.delegate respondsToSelector:@selector(addVcard:vcard:)]) {
        Vcard *vcard = [[Vcard alloc] init];
        
        vcard.name = self.name.text;
        vcard.tel = self.tel.text;
        
        [self.delegate addVcard:self vcard:vcard];
    }
}


@end
