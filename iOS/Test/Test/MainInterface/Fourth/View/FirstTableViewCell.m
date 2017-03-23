//
//  FirstTableViewCell.m
//  Test
//
//  Created by Utopia on 2016/11/3.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCellConfigItem

@end

@interface FirstTableViewCell()

@end

@implementation FirstTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)loadData:(id)data{
    self.configItem = data;
    self.titleLabel.text = self.configItem.title;
}


@end
