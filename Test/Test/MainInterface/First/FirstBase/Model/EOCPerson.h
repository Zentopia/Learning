//
//  EOCPerson.h
//  Test
//
//  Created by Utopia on 2017/3/7.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EOCEmployer;
@interface EOCPerson : NSObject

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong)EOCEmployer *employer;
@property (nonatomic, strong)NSDictionary *testDic;

- (void)add:(EOCEmployer *)employer;
- (void)remove:(EOCEmployer *)employer;

@end
