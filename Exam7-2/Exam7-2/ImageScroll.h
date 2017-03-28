//
//  ImageScroll.h
//  Exam7-2
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageScroll : UIView

-(instancetype)initWithFrame:(CGRect)frame; // 初始化
-(void)execute:(NSArray*)data ti:(NSTimeInterval)ti; // 程序入口
-(void)on_timer; // 启动定时器
-(void)off_timer; // 停止定时器
@end
