//
//  WNXSelectCityView.h
//  城觅
//
//  Created by isoftstone on 15/8/6.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WNXMenuButton,WNXCityButton;
typedef void (^citychange)(NSString *cityName);
@interface WNXSelectCityView : UIView
@property (copy, nonatomic) citychange changeCityName;

//根据传入的按钮初始化selectView
+ (instancetype)selectCityViewWithCity:(WNXCityButton *)cityBtn;


- (void)showSelectViewToSuperView:(UIView *)superView belowView:(UIView *)belowView;
@end
