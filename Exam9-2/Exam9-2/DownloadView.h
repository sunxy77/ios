//
//  DownloadView.h
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadView : UIView
@property (nonatomic, strong) UIBezierPath *path;
@property(nonatomic,assign) CGFloat angle;
@property(nonatomic,assign) CGPoint pos;
@property(nonatomic,assign) CGFloat diameter;

-(void)download;

@end
