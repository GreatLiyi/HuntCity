//
//  WNXCityButton.m
//  城觅
//
//  Created by isoftstone on 15/8/6.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXCityButton.h"

@implementation WNXCityButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat imageX = self.bounds.size.width/2 +20;
    CGFloat imageY = self.imageView.bounds.origin.y;
    CGFloat imageW = self.imageView.bounds.size.width;
    CGFloat imageH = self.imageView.bounds.size.height;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat titleX =self.bounds.size.width/2 - 20;
    self.titleLabel.frame = CGRectMake(titleX, self.titleLabel.frame.origin.y, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);

}
@end
