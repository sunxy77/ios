//
//  weixinCell.m
//  Example7-2c
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "weixinCell.h"

@interface weixinCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *say;
@property (weak, nonatomic) IBOutlet UILabel *sayTime;

@end

@implementation weixinCell

-(void)setModel:(Friend *)model {
    _model = model;
    
    self.icon.image = [UIImage imageNamed:model.icon];
    self.name.text = model.name;
    self.say.text = model.say;
    self.sayTime.text = model.sayTime;
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
