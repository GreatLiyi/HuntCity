//
//  WNXSelectCityView.m
//  城觅
//
//  Created by isoftstone on 15/8/6.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXSelectCityView.h"
#import "WNXMenuButton.h"
#import "WNXCityButton.h"
@interface WNXSelectCityView()
@property (strong, nonatomic) WNXMenuButton *firstBtn;
@property (strong, nonatomic) WNXMenuButton *secondBtn;
@property (strong, nonatomic) WNXMenuButton *thirdBtn;

@property (nonatomic, strong) NSArray *cityNames;
@end
@implementation WNXSelectCityView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    self.alpha = 0;
    self.firstBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    self.secondBtn = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    self.thirdBtn  = [WNXMenuButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.firstBtn];
    [self addSubview:self.secondBtn];
    [self addSubview:self.thirdBtn];
}

+ (instancetype )selectCityViewWithCity:(WNXCityButton *)cityBtn{
    WNXSelectCityView *view = [[self alloc ]initWithFrame:CGRectMake(cityBtn.frame.origin.x
                                                                    , cityBtn.frame.origin.y, cityBtn.frame.size.width, cityBtn.frame.size.height*4)];
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:@[@"北京",@"上海",@"广州",@"深圳"]];
    NSString *cityName = [cityBtn titleForState:UIControlStateNormal];
    for (int i = 0 ; i < arrayM.count; i++) {
        if ([arrayM[i] isEqualToString:cityName]) {
            [arrayM exchangeObjectAtIndex:i withObjectAtIndex:0];
        }
    }
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = cityBtn.layer.cornerRadius;
    view.backgroundColor = cityBtn.backgroundColor;
    return view;
}

- (void)setCityNames:(NSArray *)cityNames{
    _cityNames = cityNames;
    for (int i = 1; i < cityNames.count; i++) {
        [self setBtn:cityNames[i-1] index:i];
    }
    
}

- (void)setBtn:(WNXMenuButton*)btn index:(int)index{
    CGFloat btnx = 0;
    CGFloat btnW = self.bounds.size.width;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btny = btnH;
    CGFloat margin = btnW *0.15;
    //设置分割线
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(btnx, index * btny, btnW- 2 *margin, 1);
    view.backgroundColor = [UIColor whiteColor];
    view.alpha = 0.3;
    [self addSubview:view];
    
    btn.frame = CGRectMake(btnx, index * btny, btnW, btnH);
    btn.backgroundColor = self.backgroundColor;
    [btn setTitle:_cityNames[index] forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];

}

//移除selectView
- (void)hideSelectView{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)btnClick:(WNXMenuButton *)btn{
    if (self.changeCityName) {
        self.changeCityName([btn titleForState:UIControlStateNormal]);
    }
}
@end
