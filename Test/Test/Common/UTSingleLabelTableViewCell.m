//
//  UTSingleLabelTableViewCell.m
//  YZWaimaiMerchants
//
//  Created by Utopia on 2016/10/26.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTSingleLabelTableViewCell.h"

#define TITLE_LABEL_HEIGHT 40

@interface UTSingleLabelTableViewCell()

@property (strong, nonatomic)UILabel *titleLabel;
@property (copy, nonatomic)NSString *title;

@end

@implementation UTSingleLabelTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
    }
    return self;
}

- (void)createView{
    [self.contentView addSubview:self.titleLabel];
}

- (void)setAutolayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(TITLE_LABEL_HEIGHT);
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_lessThanOrEqualTo(self.contentView.mas_right).offset(-10);
    }];
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

- (void)loadData:(NSDictionary *)data{
    self.title = [data objectForKey:@"title"];
    self.titleLabel.text = self.title;
}

+ (CGSize)cellSize{
    return CGSizeMake(UTScreenWidth, TITLE_LABEL_HEIGHT + 10 + 10);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
