//
//  main.m
//  TestOC
//
//  Created by Utopia on 2017/3/14.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "SimthPerson.h"
#import "EOCAutoDictionary.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        EOCAutoDictionary *dic = [EOCAutoDictionary new];
        dic.date = [NSDate dateWithTimeIntervalSince1970:475372800];
        NSLog(@"dict.date = %@", dic.date);
    }
    return 0;
}


