//
//  LoginController.m
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self textchange];
    
    NSNotificationCenter *notify = [NSNotificationCenter defaultCenter];
    [notify addObserver:self selector:@selector(textchange) name:UITextFieldTextDidChangeNotification object:self.account];
    [notify addObserver:self selector:@selector(textchange) name:UITextFieldTextDidChangeNotification object:self.password];
}

#pragma mark - NSObject
-(void)dealloc {
    NSNotificationCenter *notify = [NSNotificationCenter defaultCenter];
    [notify removeObserver:self name:UITextFieldTextDidChangeNotification object:self.account];
    [notify removeObserver:self name:UITextFieldTextDidChangeNotification object:self.password];
}

-(void)textchange {
    if (self.account.text.length > 0
        && self.password.text.length > 0) {
        self.loginBtn.enabled = TRUE;
    } else {
        self.loginBtn.enabled = FALSE;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *dest = segue.destinationViewController;
    dest.navigationItem.title = [NSString stringWithFormat:@"%@通讯录",self.account.text];
    
}

- (IBAction)login:(UIButton *)sender {
    if ([self.account.text isEqualToString:@"abc"]) {
        
        if ([self.password.text isEqualToString:@"123"]) {
            // 验证成功
        
            [self performSegueWithIdentifier:@"login2contact" sender:nil];
        } else {
            //初始化提示框；
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码错误" preferredStyle: UIAlertControllerStyleAlert];
            
            [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //点击按钮的响应事件；
            }]];
            
            //弹出提示框；
            [self presentViewController:alert animated:true completion:nil];
            
        }
    } else {
        //初始化提示框；
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名不存在，请重新输入" preferredStyle: UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //点击按钮的响应事件；
        }]];
        
        //弹出提示框；
        [self presentViewController:alert animated:true completion:nil];
    }
}

@end
