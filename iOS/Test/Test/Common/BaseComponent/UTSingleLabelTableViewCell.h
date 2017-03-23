//
//  UTSingleLabelTableViewCell.h
//  YZWaimaiMerchants
//
//  Created by Utopia on 2016/10/26.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "UTTableViewCell.h"

@interface UTSingleLabelTableViewCellConfigItem : UTTableViewCellConfigItem

@property (copy, nonatomic)NSString *title;

@end

@interface UTSingleLabelTableViewCell : UTTableViewCell

@property (strong, nonatomic)UILabel *titleLabel;

@end
