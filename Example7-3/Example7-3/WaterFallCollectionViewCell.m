//
//  WaterFallCollectionViewCell.m
//  Example7-3
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "WaterFallCollectionViewCell.h"

#define fImgWidth ([UIScreen mainScreen].bounds.size.width - 15) / 2 // 图片宽度

@implementation WaterFallCollectionViewCell

-(void)setImage:(UIImage *)image {
    
    if (_image != image) {
        _image = image;
    }
    
    [self setNeedsDisplay];
}

#pragma mark <UIView>
// 方法重写
-(void)drawRect:(CGRect)rect {
    float newHeight = _image.size.height / _image.size.width * fImgWidth;
    
    [_image drawInRect:CGRectMake(0, 0, fImgWidth, newHeight)];
}
@end
