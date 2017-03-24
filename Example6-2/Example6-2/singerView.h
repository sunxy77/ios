//
//  singerView.h
//  Example6-2
//
//  Created by 孙晓晔 on 2017/3/24.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singer.h"

@interface singerView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *img; // 歌手图片
@property (weak, nonatomic) IBOutlet UILabel *label; // 歌曲名称
@property (weak, nonatomic) IBOutlet UIButton *btn; // 下载按钮

@property (nonatomic, strong) Singer *singer; // 模型数据

+(instancetype)templateView; // 获取一个View模板

@end
