//
//  FRPSignInService.m
//  Test
//
//  Created by Utopia on 2016/11/11.
//  Copyright © 2016年 Utopia. All rights reserved.
//

#import "FRPSignInService.h"

@implementation FRPSignInService

- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(SignInResponse)completeBlock{
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        BOOL success = [username isEqualToString:@"user"] && [password isEqualToString:@"password"];
        completeBlock(success);
    });
}

@end
