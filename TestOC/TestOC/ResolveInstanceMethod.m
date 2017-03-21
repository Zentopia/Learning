//
//  ResolveInstanceMethod.m
//  TestOC
//
//  Created by Utopia on 2017/3/17.
//  Copyright © 2017年 Utopia. All rights reserved.
//

#import "ResolveInstanceMethod.h"
#import <objc/runtime.h>

@implementation ResolveInstanceMethod

id autoDictionaryGetter(id self, SEL _cmd);
void autoDictionarySetter(id self, SEL _cmd, id value);

- (void)run{
    
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSString *selectorString = NSStringFromSelector(sel);
//    if (/* selector is from a @dynamic property */true) {
//        class_addMethod(self, sel, (IMP)autoDictionarySetter, @"v@:@");
//    }
//}

@end
