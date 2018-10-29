//
//  UIFont+runTime.m
//  runtime(消息机制)
//
//  Created by 刘鹿杰的mac on 2018/9/13.
//  Copyright © 2018年 刘鹿杰的mac. All rights reserved.
//

#import "UIFont+runTime.h"

#import <objc/runtime.h>
#define UI_SCREEN  375 // UI设计原型图的手机尺寸宽度(6), 6p的--414

@implementation UIFont (runTime)

+ (void)load {
    // 获取替换后的类方法
    Method newMethod1 = class_getClassMethod([self class], @selector(adjustSystemFontOfSize:));
    // 获取替换前的类方法
    Method method1 = class_getClassMethod([self class], @selector(systemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod1, method1);
    
    
    // 获取替换后的类方法
    Method newMethod2 = class_getClassMethod([self class], @selector(adjustFontWithName:size:));
    // 获取替换前的类方法
    Method method2 = class_getClassMethod([self class], @selector(fontWithName:size:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod2, method2);
    
    
    // 获取替换后的类方法
    Method newMethod3 = class_getClassMethod([self class], @selector(adjustSystemFontOfSize:weight:));
    // 获取替换前的类方法
    Method method3 = class_getClassMethod([self class], @selector(systemFontOfSize:weight:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod3, method3);
    
    // 获取替换后的类方法
    Method newMethod4 = class_getClassMethod([self class], @selector(adjustBoldSystemFontOfSize:));
    // 获取替换前的类方法
    Method method4 = class_getClassMethod([self class], @selector(boldSystemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod4, method4);
    
    // 获取替换后的类方法
    Method newMethod5 = class_getClassMethod([self class], @selector(adjustItalicSystemFontOfSize:));
    // 获取替换前的类方法
    Method method5 = class_getClassMethod([self class], @selector(italicSystemFontOfSize:));
    // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
    method_exchangeImplementations(newMethod5, method5);
    /*容易让UIAlertController  变形
     // 获取替换后的类方法
     Method newMethod6 = class_getClassMethod([self class], @selector(adjustFontWithDescriptor:size:));
     // 获取替换前的类方法
     Method method6 = class_getClassMethod([self class], @selector(fontWithDescriptor:size:));
     // 然后交换类方法，交换两个方法的IMP指针，(IMP代表了方法的具体的实现）
     method_exchangeImplementations(newMethod6, method6);
     */
}

+ (UIFont *)adjustSystemFontOfSize:(CGFloat)fontSize {
    UIFont *newFont = nil;
    newFont = [UIFont adjustSystemFontOfSize:[UIFont adjustFontSize:fontSize]];
    return newFont;
}
+ (UIFont *)adjustFontWithName:(NSString *)name size:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustFontWithName:name size:[UIFont adjustFontSize:fontSize]];
    return newFont;
}
+ (UIFont *)adjustSystemFontOfSize:(CGFloat)fontSize weight:(UIFontWeight)weight{
    UIFont *newFont = nil;
    newFont = [UIFont adjustSystemFontOfSize:[UIFont adjustFontSize:fontSize]];
    return newFont;
}
+ (UIFont *)adjustBoldSystemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustBoldSystemFontOfSize:[UIFont adjustFontSize:fontSize]];
    return newFont;
}
+ (UIFont *)adjustItalicSystemFontOfSize:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustItalicSystemFontOfSize:[UIFont adjustFontSize:fontSize]];
    return newFont;
}

+ (UIFont *)adjustFontWithDescriptor:(UIFontDescriptor *)descriptor size:(CGFloat)fontSize{
    UIFont *newFont = nil;
    newFont = [UIFont adjustFontWithDescriptor:descriptor size:[UIFont adjustFontSize:fontSize]];
    return newFont;
}
+ (CGFloat)adjustFontSize:(CGFloat)fontSize{
    return fontSize * [UIScreen mainScreen].bounds.size.width / UI_SCREEN;
}
@end
