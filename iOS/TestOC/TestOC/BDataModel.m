//
//  BDataModel.m
//  TestOC
//
//  Created by Utopia on 2017/4/6.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import "BDataModel.h"


@implementation BDataModel
{
    NSString *_name;
}

- (NSString *)getName{
    return _name;
}

- (void)setName:(NSString *)name{
    _name = name;
}

@end
