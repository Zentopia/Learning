//
//  Person.h
//  TestOC
//
//  Created by Utopia on 2017/3/14.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonBuilder.h"

@interface Person : NSObject

@property (copy, nonatomic)NSString *firstName;
@property (copy, nonatomic)NSString *lastName;

- (instancetype)personWithBlock:(void (^)(PersonBuilder *)) block;


@end

@interface Person(FriendShip)

- (void)addFriend:(Person *)person;

@end
