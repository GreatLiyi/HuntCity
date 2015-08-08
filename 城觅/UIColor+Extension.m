//
//  UIColor+Extension.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+(instancetype)randColor{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);

    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255 alpha:1];
}
+ (UIColor *)colorWithHexString:(NSString *)string alpha:(CGFloat )alpha1{
    NSString *cString = [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
        
    }
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length]!= 6) {
        return [UIColor clearColor];
    }
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString]scanHexInt:&g];
    [[NSScanner scannerWithString:bString]scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha1];
}
@end
