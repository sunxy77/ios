//
//  MeiTuanCell.m
//  Exam7-1
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MeiTuanCell.h"

@interface MeiTuanCell()
@property (weak, nonatomic) IBOutlet UIImageView *pic; // 图片
@property (weak, nonatomic) IBOutlet UILabel *name; //  标题
@property (weak, nonatomic) IBOutlet UILabel *price; // 价格
@property (weak, nonatomic) IBOutlet UILabel *sold; // 已售

@end

@implementation MeiTuanCell

-(void)setModel:(MeiTuan *)model {
    _model = model;
    
    self.pic.image = [UIImage imageNamed:model.pic];
    self.name.text = model.name;
    
    // 数据格式化
    self.price.text = [NSString stringWithFormat:@"%@元", model.price];
    self.sold.text = [NSString stringWithFormat:@"已售%@", model.sold];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
