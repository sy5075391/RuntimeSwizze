//
//  NSObject+SwizzleMethod.h
//  ExchangeMethodDemo
//
//  Created by Jamesholy on 2019/7/4.
//  Copyright © 2019 Jamesholy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (SwizzleMethod)

+ (BOOL)swizzleMethod:(Class)class orgSel:(SEL)origSel swizzSel:(SEL)altSel;
+ (BOOL)swizzleClassMethod:(Class)class orgSel:(SEL)origSel swizzSel:(SEL)altSel;
@end

NS_ASSUME_NONNULL_END
