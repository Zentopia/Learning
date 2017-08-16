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
#import "PersonBuilder.h"
#import "BDataModel.h"
#import "BDataModel+Utopia.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        EOCAutoDictionary *dic = [EOCAutoDictionary new];
        dic.date = [NSDate dateWithTimeIntervalSince1970:475372800];
        NSLog(@"dict.date = %@", dic.date);
        
        PersonBuilder *personBuilder = [PersonBuilder new];
        personBuilder.firstName = @"Apple";
        personBuilder.lastName = @"Google";
        
        BDataModel *model = [BDataModel new];
       
        model.name = @"apple";
        
        BDataModel *model1 = model;
        
        printf("retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(model)));

        
                
    }
    
    return 0;
}


