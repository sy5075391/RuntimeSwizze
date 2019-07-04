//
//  NSObject+SwizzleMethod.m
//  ExchangeMethodDemo
//
//  Created by Jamesholy on 2019/7/4.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>
@implementation NSObject (SwizzleMethod)

+ (BOOL)swizzleMethod:(Class)class orgSel:(SEL)origSel swizzSel:(SEL)altSel {
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method altMethod = class_getInstanceMethod(class, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    BOOL didAddMethod = class_addMethod(class,origSel,
                                        method_getImplementation(altMethod),
                                        method_getTypeEncoding(altMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,altSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    
    return YES;
}

+ (BOOL)swizzleClassMethod:(Class)class orgSel:(SEL)origSel swizzSel:(SEL)altSel {
    Method origMethod = class_getClassMethod(class, origSel);
    Method altMethod = class_getClassMethod(class, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    BOOL didAddMethod = class_addMethod(object_getClass(class),origSel,
                                        method_getImplementation(altMethod),
                                        method_getTypeEncoding(altMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,altSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    
    return YES;
}


@end
