//
//  LocationSearchTableViewCell.m
//  Test
//
//  Created by Utopia on 2016/11/14.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "LocationSearchTableViewCell.h"

@implementation LocationSearchTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setAutolayout{

}

- (void)loadData:(id)data{
    self.configItem = data;
    self.titleLabel.text = self.configItem.title;
}

@end
