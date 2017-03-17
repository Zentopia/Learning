//
//  FRPSignInService.h
//  Test
//
//  Created by Utopia on 2016/11/11.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SignInResponse)(BOOL);

@interface FRPSignInService : NSObject

- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(SignInResponse)completeBlock;

@end
