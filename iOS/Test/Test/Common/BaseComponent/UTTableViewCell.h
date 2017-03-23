//
//  UTTableViewCell.h
//  Test
//
//  Created by Utopia on 2016/10/25.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UTTableViewCellConfigItem: NSObject

@property (strong, nonatomic)NSIndexPath *indexPath;

@end

@interface UTTableViewCell : UITableViewCell

- (void)createView;
- (void)setAutolayout;
- (void)loadData:(id)data;
+ (CGSize)cellSize;

@end
