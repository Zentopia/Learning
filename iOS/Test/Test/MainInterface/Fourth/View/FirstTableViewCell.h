//
//  FirstTableViewCell.h
//  Test
//
//  Created by Utopia on 2016/11/3.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTTableViewCell.h"
#import "UTSingleLabelTableViewCell.h"

@interface FirstTableViewCellConfigItem : UTSingleLabelTableViewCellConfigItem

@end

@interface FirstTableViewCell : UTSingleLabelTableViewCell

@property (strong, nonatomic)FirstTableViewCellConfigItem *configItem;

@end
