//
//  MyCell.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MyCell.h"

@interface MyCell()

@end

@implementation MyCell

-(void)setModel:(NSString*)photo name:(NSString*)name account:(NSString*)account {
    
    self.photo.image = [UIImage imageNamed:photo];
    self.name.text = name;
    
    self.account.text = account;
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
