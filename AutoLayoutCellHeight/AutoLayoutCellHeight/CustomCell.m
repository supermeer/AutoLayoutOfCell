//
//  CustomCell.m
//  AutoLayoutCellHeight
//
//  Created by 曹永超 on 17/3/14.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
//    [self updateConstraintsIfNeeded];
    
    [self layoutIfNeeded];
}

@end
