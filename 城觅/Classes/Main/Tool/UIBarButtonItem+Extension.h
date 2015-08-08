//
//  UIBarButtonItem+Extension.h
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  根据图片返回一个小的barbuttomItem
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)selector;
/**
 *  返回大号barButtomItem
 */
+ (UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)selector;
/**
 *  根据图片快速创建barbuttomItem，自定义大小
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)selector width:(CGFloat)width height:(CGFloat)height;
/**
 *  根据文字快速创建一个barbuttomItem
 */
+ (UIBarButtonItem *)initWithNormalTitle:(NSString *)title  target:(id)target action:(SEL)selector titleColor:(UIColor *)titleColor;
@end
