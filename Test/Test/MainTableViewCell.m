//
//  MainTableViewCell.m
//  Test
//
//  Created by Utopia on 2016/10/25.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "MainTableViewCell.h"

#define TITLE_LABEL_HEIGHT 40

@interface MainTableViewCell()

@property (strong, nonatomic)UILabel *titleLabel;

@end

@implementation MainTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void)createView{
    [self.contentView addSubview:self.titleLabel];
}

- (void)setAutolayout{
    self.titleLabel
}

+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

- (void)updateConstraints{

    [self setAutolayout];
    
    [super updateConstraints];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
