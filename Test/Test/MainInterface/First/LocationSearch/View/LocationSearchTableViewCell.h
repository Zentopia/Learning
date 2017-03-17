//
//  LocationSearchTableViewCell.h
//  Test
//
//  Created by Utopia on 2016/11/14.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTSingleLabelTableViewCell.h"

@interface LocationSearchTableViewCellConfigItem : UTSingleLabelTableViewCellConfigItem

@end

@interface LocationSearchTableViewCell : UTSingleLabelTableViewCell

@property (strong, nonatomic)LocationSearchTableViewCellConfigItem *configItem;

@end
