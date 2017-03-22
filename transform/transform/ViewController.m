//
//  ViewController.m
//  transform
//
//  Created by 孙晓晔 on 2017/3/22.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *pic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)move:(UIButton *)sender {
    CGRect rect = self.pic.frame;
    
    switch (sender.tag) {
        case 10:
            rect.origin.y -= 10;
            break;
        case 20:
            rect.origin.y += 10;
            break;
        case 30:
            rect.origin.x -= 10;
            break;
        case 40:
            rect.origin.x += 10;
            break;
        default:
            break;
    }
    
    
    self.pic.frame = rect;
}

- (IBAction)Zoom:(UIButton *)sender {
    
    if (sender.tag == 50) {
        self.pic.transform = CGAffineTransformScale(self.pic.transform, 1.1, 1.1);
    } else if (sender.tag == 60) {
        self.pic.transform = CGAffineTransformScale(self.pic.transform, 0.9, 0.9);
    }
    /*
    CGRect rect = self.pic.bounds;
    
    if (sender.tag == 50) {
        
        rect.size.width += 10;
        rect.size.height += 10;
        
    } else if (sender.tag == 60) {
        
        rect.size.width -= 10;
        rect.size.height -= 10;
    }
    
    self.pic.bounds = rect;
     */
    
    /*
     CGRect rect = self.pic.frame;
     
     if (sender.tag == 50) {
     rect.origin.x -= 5;
     rect.origin.y -= 5;
     
     rect.size.width += 10;
     rect.size.height += 10;
     
     } else if (sender.tag == 60) {
     rect.size.width -= 10;
     rect.size.height -= 10;
     
     rect.origin.x += 5;
     rect.origin.y += 5;
     }
     
     self.pic.frame = rect;
     */

}

- (IBAction)rotate:(UIButton *)sender {
    
    if (sender.tag == 70) {
        self.pic.transform = CGAffineTransformRotate(self.pic.transform, M_PI_2);
    } else if (sender.tag == 80) {
        self.pic.transform = CGAffineTransformRotate(self.pic.transform, -M_PI_2);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
