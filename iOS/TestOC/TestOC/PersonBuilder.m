//
//  PersonBuilder.m
//  TestOC
//
//  Created by Utopia on 2017/3/31.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import "PersonBuilder.h"

@implementation PersonBuilder

- (PersonBuilder *)personFirstName:(NSString*)firstName{
    
    _firstName = firstName;
    
    return self;
}

- (PersonBuilder *)personLastName:(NSString *)lastName{
    _lastName = lastName;
    
    return self;
}

@end
