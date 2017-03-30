//
//  ContactEditController.m
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ContactEditController.h"
#import "ContactController.h"

@interface ContactEditController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *tel;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;

@end

@implementation ContactEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name.text = self.vcard.name;
    self.tel.text = self.vcard.tel;
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
//    
//}

- (IBAction)edit:(UIButton *)sender {
    
    //1.关闭当前页面
    [self.navigationController popViewControllerAnimated:YES];
    //2.通知代理
    if ([self.delegate respondsToSelector:@selector(editVcard:vcard:)]) {
        //更新数据模型
        self.vcard.name = self.name.text;
        self.vcard.tel = self.tel.text;
        
        [self.delegate editVcard:self vcard:self.vcard];
    }
    
}

@end
