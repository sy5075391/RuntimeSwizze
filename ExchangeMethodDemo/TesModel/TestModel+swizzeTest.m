//
//  TestModel+swizzeTest.m
//  ExchangeMethodDemo
//
//  Created by Jamesholy on 2019/7/4.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import "TestModel+swizzeTest.h"
#import "NSObject+SwizzleMethod.h"
@implementation TestModel (swizzeTest)

+ (void)load {
    
    // 使用这种写法可以
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 方式一： 同时使用一个方法 完成类方法 和对象方法的交换方法
        [self swizzleMethod:self orgSel:@selector(instanceMethod) swizzSel:@selector(swizzeInstanceMehtod)];
        [self swizzleMethod:object_getClass(self) orgSel:@selector(classMethod) swizzSel:@selector(swizzeClassMehtod)];

        // 方式二：类方法 对象方法分别用不同的方法
        [self swizzleMethod:self orgSel:@selector(instanceMethod) swizzSel:@selector(swizzeInstanceMehtod)];
        [self swizzleClassMethod:self orgSel:@selector(classMethod) swizzSel:@selector(swizzeClassMehtod)];
    });
    
}


- (void)swizzeInstanceMehtod {
    NSLog(@"调用了交换后的对象方法");
}

+ (void)swizzeClassMehtod {
    NSLog(@"调用了交换后的类方法");
}

@end
