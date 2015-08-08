
//
//  WNXSearchHeaderView.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXSearchHeaderView.h"
@interface WNXSearchHeaderView()
@property (strong, nonatomic) UILabel *lable;
@end
@implementation WNXSearchHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        self.backgroundColor = WNXColor(230, 230,230);
        self.lable = [[UILabel alloc]init];
        self.lable.textColor = [UIColor lightGrayColor];
        self.lable.font = [UIFont systemFontOfSize:20];
        self.lable.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.lable];
    }
    return self;
}

//便利构造方法
+ (instancetype)headView{
    WNXSearchHeaderView *head = [[WNXSearchHeaderView alloc]init];
    
    return head;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.lable.frame = CGRectMake(20, 0, self.bounds.size.width- 20, self.bounds.size.height);
}
@end
