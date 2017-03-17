//
//  UTTableViewCell.m
//  Test
//
//  Created by Utopia on 2016/10/25.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTTableViewCell.h"

@implementation UTTableViewCellConfigItem

@end

@implementation UTTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
        [self setAutolayout];
    }
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

- (void)updateConstraints{
    
    [self setAutolayout];
    [super updateConstraints];
}

- (void)createView{

}

- (void)setAutolayout{
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadData:(id)data{

}

+ (CGSize)cellSize{
    return CGSizeZero;
}

@end
