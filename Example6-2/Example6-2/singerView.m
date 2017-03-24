//
//  singerView.m
//  Example6-2
//
//  Created by 孙晓晔 on 2017/3/24.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "singerView.h"

@implementation singerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 获取一个view模板
+(instancetype)templateView {
    
    // 读取xib文件数据
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"singer" owner:nil options:nil];
    
    singerView *viewFromXib = [arr firstObject];
    
    return viewFromXib;
}

-(void)setSinger:(Singer *)singer {
    if (_singer != singer) {
        _singer = singer;
        
        self.img.image = [UIImage imageNamed:singer.pic];
        self.label.text = singer.songname;
    }
}

// 点击下载执行的操作
- (IBAction)download:(UIButton *)btn {
    
    btn.enabled = NO;
    
    // 创建一个文件标签用于显示下载操作后的通知信息
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 400, 200, 40)];
    tipLabel.backgroundColor = [UIColor grayColor];
    tipLabel.text = @"下载完成";
    
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.superview addSubview:tipLabel];
    
    tipLabel.alpha = 1;
    
    // 动画效果，透明效果，2秒消失
    [UIView animateWithDuration:2.0 animations:^ {
        tipLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [tipLabel removeFromSuperview];
    }];
}

@end
