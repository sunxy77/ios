//
//  MyView.m
//  Exam9-1
//
//  Created by 孙晓晔 on 2017/4/2.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //create a mutable path
    self.path = [[UIBezierPath alloc] init];
    
    self.path.lineJoinStyle = kCGLineJoinRound;
    self.path.lineCapStyle = kCGLineCapRound;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //draw path
//    [[UIColor clearColor] setFill];
    [[UIColor redColor] setStroke];
    
    [self.path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the starting point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //move the path drawing cursor to the starting point
    [self.path moveToPoint:point];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get the current point
    CGPoint point = [[touches anyObject] locationInView:self];
    
    //add a new line segment to our path
    [self.path addLineToPoint:point];
    
    //redraw the view
    [self setNeedsDisplay];
}

@end
