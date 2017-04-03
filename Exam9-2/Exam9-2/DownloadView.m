//
//  DownloadView.m
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "DownloadView.h"


@interface DownloadView()

@end

@implementation DownloadView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    _angle = 0;
    self.path = [[UIBezierPath alloc] init];
    
    float center_x = 75;
    float center_y = 75;
    CGPoint center = CGPointMake(center_x, center_y);
    
    [self.path addArcWithCenter:center radius:50 startAngle:-M_PI/2 endAngle:M_PI*2-M_PI/2 clockwise:1];
    CGPoint pos = self.path.currentPoint;
    //
    [self.path addLineToPoint:CGPointMake(pos.x, pos.y+5)];
    
    [self.path addArcWithCenter:center radius:45 startAngle:-M_PI/2 endAngle:-M_PI*2-M_PI/2 clockwise:0];
}

-(void)download {
    float center_x = 75;
    float center_y = 75;
    CGPoint center = CGPointMake(center_x, center_y);
    
    [self.path addArcWithCenter:center radius:45 startAngle:-M_PI/2 endAngle:self.angle-M_PI/2 clockwise:1];
    
    [self.path addLineToPoint:center];
    [self.path addLineToPoint:CGPointMake(75, 25)];
    
    _angle += M_PI / 36;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [[UIColor redColor] setStroke];
    
//    [self.path stroke];
    [self.path fill];
}

-(void)aa {
    CGContextRef cg = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(cg, 75, 75, 50, -M_PI, M_PI/2, 0);
    CGContextAddLineToPoint(cg, 75, 75);
    
    //    CGContextStrokePath(cg);
    
    CGContextFillPath(cg);
}

@end
