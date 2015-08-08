
//
//  WNXSearchTextField.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXSearchTextField.h"

@implementation WNXSearchTextField
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.placeholder = @"搜索";
        self.font = [UIFont systemFontOfSize:16];
        UIImage *image = [UIImage imageNamed:@"GroupCell"];
        self.background = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchm"]];
        imageView.frame = CGRectMake(0, 0, 35, 35);
        self.leftView = imageView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return self;
}
@end
