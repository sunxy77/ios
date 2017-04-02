//
//  ViewController.m
//  Exam9-1
//
//  Created by 孙晓晔 on 2017/4/2.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MyView *myView;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.myView.path.lineWidth = self.mySlider.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onSlider:(UISlider *)sender {
    
    self.myView.path.lineWidth = self.mySlider.value;
    [self.myView setNeedsDisplay];
}
- (IBAction)onClear:(UIButton *)sender {
    [self.myView.path removeAllPoints];
    [self.myView setNeedsDisplay];
}
- (IBAction)onSave:(UIButton *)sender {
    
    UIGraphicsBeginImageContext(CGSizeMake(self.myView.bounds.size.width, self.myView.bounds.size.height));
    [self.myView drawViewHierarchyInRect:self.myView.bounds afterScreenUpdates:YES];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}

- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSString *msg = nil ;
    if(error != NULL){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alert animated:true completion:nil];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle: UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
    }]];
    
    //弹出提示框；
    [self presentViewController:alert animated:true completion:nil];
}

@end
