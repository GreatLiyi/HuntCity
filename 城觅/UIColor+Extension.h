//
//  UIColor+Extension.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (instancetype)randColor;

/**
 *  16进制字符转换成UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat )alpha1;
@end
