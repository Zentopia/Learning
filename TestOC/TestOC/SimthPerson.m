//
//  SimthPerson.m
//  TestOC
//
//  Created by Utopia on 2017/3/14.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import "SimthPerson.h"

@implementation SimthPerson

- (void)setLastName:(NSString *)lastName{
    if (![lastName isEqualToString:@"Smith"]) {
        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
    }
    self.lastName = lastName;
}

@end
