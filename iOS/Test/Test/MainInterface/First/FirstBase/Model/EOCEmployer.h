//
//  EOCEmployer.h
//  Test
//
//  Created by Utopia on 2017/3/7.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOCPerson.h"

@interface EOCEmployer : NSObject

- (void)addEmplyee:(EOCPerson *)person;
- (void)removeEmloyee:(EOCPerson *)person;

@end
