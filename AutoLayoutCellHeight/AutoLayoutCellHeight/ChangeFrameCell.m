//
//  ChangeFrameCell.m
//  AutoLayoutCellHeight
//
//  Created by 曹永超 on 2017/11/15.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import "ChangeFrameCell.h"
#import "Masonry.h"

@interface ChangeFrameCell () {
    
    UIView *_imageBGView;
    
    UILabel *_contentLB;
    
}

@end

@implementation ChangeFrameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor = [UIColor colorWithRed:(arc4random() % 256) / 255.0 green:(arc4random() % 256) / 255.0 blue:(arc4random() % 256) / 255.0 alpha:1];
        
        //必须给contentView加约束
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.trailing.top.bottom.mas_equalTo(0);
            
//            make.leading.top.mas_equalTo(0);
            
        }];
        
        [self.contentView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"contentView_frame"];
        
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"cell_frame"];
        
        _contentLB = [UILabel new];
        _contentLB.font = [UIFont systemFontOfSize:15];
        _contentLB.numberOfLines = 0;
        [self.contentView addSubview:_contentLB];
        [_contentLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.leading.trailing.mas_equalTo(20);
        }];
        
        _imageBGView = [UIView new];
        
        _imageBGView.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_imageBGView];
        
        [_imageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.trailing.leading.mas_equalTo(0);
            
            make.top.mas_equalTo(_contentLB);
            
            make.height.mas_equalTo(0);
        }];
        
    }
    
    return self;
}

//通过添加监听可以看出cell的height其实是随着contentView的height改变的 这就是cell能自适应高度的前提
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([(__bridge NSString *)context isEqualToString:@"contentView_frame"]) {
        
        NSLog(@"=========== %ld ===========  contentView_height changed",self.tag);
        
        NSLog(@"contentView_frame : %@  \n cell_height: %lf \n \n \n",change,self.frame.size.height);
        
        return;
    }
    
    if ([(__bridge NSString *)context isEqualToString:@"cell_frame"]) {
        
        NSLog(@"=========== %ld ===========  cell_height changed",self.tag);
        
        NSLog(@"contentView_frame : %@   \n cell_frame: %@ \n \n \n",NSStringFromCGRect(self.contentView.frame),change);
        
    }
}

- (void)setContent:(NSString *)content {
    
    _contentLB.text = content;
    
    [self layoutSubviews];
    
}

- (void)updateConstraints {
    
    [super updateConstraints];

    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {

        make.bottom.mas_equalTo(_contentLB.mas_bottom).with.offset(20);
    }];

    [_contentLB sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
