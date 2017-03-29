//
//  MessageCell.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MessageCell.h"

@interface MessageCell()


@end

@implementation MessageCell

-(void)setModel:(Message *)model {
    _model = model;
//    
    self.pic.image = [UIImage imageNamed:model.pic];
    self.name.text = model.name;
    
    self.msg.text = model.msg;
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
