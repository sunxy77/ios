//
//  DownloadView.m
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "DownloadView.h"

#define MY_CORNER_RADIUS 20 // 图片圆角半经
#define MY_MARGIN 25 // 边距

@interface DownloadView()
@property (nonatomic, strong) UIBezierPath *path; // Bezier曲线
@property(nonatomic, weak) CAShapeLayer *fillLayer; // 遮罩层

@property(nonatomic, assign) CGFloat start1; // 扇形开始角度
@end

@implementation DownloadView

// 初始化
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setUp];
    }
    
    return self;
}

// 添加图片
-(void)setUp {
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imgView.image = [UIImage imageNamed:@"logo"];
    imgView.layer.cornerRadius = MY_CORNER_RADIUS;
    imgView.layer.masksToBounds = YES;
    
    [self addSubview:imgView];
}

// 开始下载，添加遮罩层
-(void)begin {
    
    self.start1 = -M_PI/2;
    
    self.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) cornerRadius:MY_CORNER_RADIUS];
    
    CGFloat radius = self.bounds.size.width / 2;
    
    CGFloat width1 = self.bounds.size.width - MY_MARGIN * 2;
    CGRect rect1 = CGRectMake(MY_MARGIN, MY_MARGIN, width1, width1);
    
    // 外圆路经
    UIBezierPath *c1 = [UIBezierPath bezierPathWithRoundedRect:rect1 cornerRadius:radius];
    
    CGFloat width2 = self.bounds.size.width - (MY_MARGIN+10) * 2;
    CGRect rect2 = CGRectMake(MY_MARGIN+10, MY_MARGIN+10, width2, width2);
    
    // 内圆路经
    UIBezierPath *c2 = [UIBezierPath bezierPathWithRoundedRect:rect2 cornerRadius:radius];
    
    [self.path appendPath:c1];
    [self.path appendPath:c2];
    
    // 始始化遮罩层
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    
    fillLayer.path = self.path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    
    fillLayer.fillColor = [UIColor grayColor].CGColor; // 充填颜色
    
    fillLayer.opacity = 0.7f; // 透明度
    
    self.fillLayer = fillLayer;
    
    [self.layer addSublayer:fillLayer];
}

// 根据已下载的进度绘制扇形
-(void)myDownload:(CGFloat)progress {
    
    CGFloat end = progress*M_PI*2-M_PI/2;
    
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2);
    
    CGFloat radius = self.bounds.size.width/2 - MY_MARGIN - 10;
    
    // 扇形
    UIBezierPath *c3 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:self.start1 endAngle: end clockwise:YES];
    
    [c3 addLineToPoint:center];
    [c3 closePath];
    
    [self.path appendPath:c3];
    
    self.fillLayer.path = self.path.CGPath;
    
    self.start1 = end; // 记录结束位置，下次继续绘制为开始位置
    
    // 下载完成移除遮罩层
    if (end > M_PI*2-M_PI/2) {
        [self.fillLayer removeFromSuperlayer];
    }
}

@end
