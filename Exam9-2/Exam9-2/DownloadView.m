//
//  DownloadView.m
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "DownloadView.h"

#define CENTER_X 75 // 圆心X坐标
#define CENTER_Y 75 // 圆心Y坐标
#define DIAMETER 50 // 圆半经

@interface DownloadView()

@end

@implementation DownloadView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        // 初始化Bezier对象
        self.path = [[UIBezierPath alloc] init];
        
        CGPoint center = CGPointMake(CENTER_X, CENTER_Y);
        
        [self.path addArcWithCenter:center radius:DIAMETER startAngle:-M_PI/2 endAngle:M_PI*2-M_PI/2 clockwise:1];
        CGPoint pos = self.path.currentPoint;
        
        // 偏移并绘制内圆
        [self.path addLineToPoint:CGPointMake(pos.x, pos.y+5)];
        
        [self.path addArcWithCenter:center radius:DIAMETER-5 startAngle:-M_PI/2 endAngle:-M_PI*2-M_PI/2 clockwise:0];
    }
    
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
}

// 根据已下载的进度绘制扇形
-(void)myDownload:(CGFloat)progress {
   
    CGPoint center = CGPointMake(CENTER_X, CENTER_Y);
    
    [self.path addArcWithCenter:center radius:DIAMETER-5 startAngle:-M_PI/2 endAngle:progress-M_PI/2 clockwise:1];
    
    [self.path addLineToPoint:center];
    [self.path addLineToPoint:CGPointMake(CENTER_X, CENTER_Y - DIAMETER)];
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self.path fill];
}

@end
