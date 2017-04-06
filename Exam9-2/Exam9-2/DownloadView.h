//
//  DownloadView.h
//  Exam9-2
//
//  Created by 孙晓晔 on 2017/4/3.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadView : UIView

@property(nonatomic,assign) CGFloat progress;

-(void)begin;
-(void)myDownload:(CGFloat)progress;

@end
