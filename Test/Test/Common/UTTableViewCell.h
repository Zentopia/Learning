//
//  UTTableViewCell.h
//  Test
//
//  Created by Utopia on 2016/10/25.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UTTableViewCell : UITableViewCell

+ (CGSize)cellSize;

- (void)loadData:(NSDictionary *)data;

@end
