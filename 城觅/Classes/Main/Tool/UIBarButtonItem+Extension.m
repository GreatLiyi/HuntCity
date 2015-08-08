//
//  UIBarButtonItem+Extension.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)selector{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)selector{
    UIImage *BigImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setBackgroundImage:BigImage forState:UIControlStateNormal];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)selector width:(CGFloat)width height:(CGFloat)height{
    UIImage *BigImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, width, height);
    [btn setBackgroundImage:BigImage forState:UIControlStateNormal];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithNormalTitle:(NSString *)title target:(id)target action:(SEL)selector titleColor:(UIColor *)titleColor{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}
@end
