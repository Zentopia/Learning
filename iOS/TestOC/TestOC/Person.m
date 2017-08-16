//
//  Person.m
//  TestOC
//
//  Created by Utopia on 2017/3/14.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import "Person.h"
#import "PersonBuilder.h"

@implementation Person

- (instancetype)initWithPersonBuilder:(PersonBuilder *)builder{
    
    if(self = [super init]){
        _lastName = builder.lastName;
        _firstName = builder.firstName;
    }
    
    return self;
}



@end
