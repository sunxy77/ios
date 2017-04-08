//
//  PlayerView.m
//  Exam9-3
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "PlayerView.h"

@interface PlayerView()<CAAnimationDelegate>


@end

@implementation PlayerView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
}





// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (IBAction)stop:(UIButton *)sender {
    
    NSLog(@"stop 35");
}

@end
