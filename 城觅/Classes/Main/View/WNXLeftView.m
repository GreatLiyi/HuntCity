//
//  WNXLeftView.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXLeftView.h"
#import "WNXMenuButton.h"
@interface WNXLeftView()
@property (weak, nonatomic) IBOutlet WNXMenuButton *areaButton;
@property (weak, nonatomic) IBOutlet WNXMenuButton *HomeButton;
@property (weak, nonatomic) IBOutlet WNXMenuButton *foundButton;
@property (weak, nonatomic) IBOutlet WNXMenuButton *unLoginButton;
@property (weak, nonatomic) IBOutlet WNXMenuButton *weiboLoginBtn;
@property (weak, nonatomic) IBOutlet WNXMenuButton *weiXinLoginBtn;
@property (weak, nonatomic) IBOutlet WNXMenuButton *setting;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstrans;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstrant;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftConstrant;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonConstrant;


@property (weak, nonatomic) UIButton *selectBtn;
@end
@implementation WNXLeftView
-(void)awakeFromNib{
   
    self.areaButton.layer.masksToBounds = YES;
    self.areaButton.layer.cornerRadius = 5;
    [self.areaButton setTitle:@"北京" forState:UIControlStateNormal];
    [self.areaButton setTitleColor:[UIColor colorWithRed:33/255 green:197/255 blue:180/255 alpha:1] forState:UIControlStateNormal];
    [self.areaButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.areaButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    self.HomeButton.tag = WNXLeftButtonTypeHome;
    self.foundButton.tag = WNXLeftButtonTypeFound;
    self.unLoginButton.tag = WNXLeftButtonTypeIcon;
    self.weiboLoginBtn.tag = WNXLeftButtonTypeSina;
    self.weiXinLoginBtn.tag = WNXLeftButtonTypeWeiXin;
}

-(void)setDelegate:(id<WNXLeftViewDelegte>)delegate{
    _delegate = delegate;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //适配
    CGFloat viewWidth = self.bounds.size.width;
    CGFloat viewHeight = self.bounds.size.height;
    
    CGFloat btnW = viewWidth * 0.7;
    CGFloat btnH = viewHeight * 0.1;
    CGFloat btnX = 40;
    self.widthConstrans.constant = btnW;
    self.heightConstrant.constant = btnH;
    self.leftConstrant.constant = btnX;
    self.buttonConstrant.constant = 50;
    [self.setting layoutIfNeeded];

}
- (IBAction)areaSelect:(WNXMenuButton *)sender {
    if ([self.delegate respondsToSelector:@selector(leftMenuViewButtonClickFrom:to:)]) {
        [self.delegate leftMenuViewButtonClickFrom:(WNXLeftButtonType)self.selectBtn.tag to:(WNXLeftButtonType)sender.tag];
    }
    if (sender.tag!= WNXLeftButtonTypeWeiXin && sender.tag != WNXLeftButtonTypeSina && sender.tag != WNXLeftButtonTypeIcon) {
        self.selectBtn.selected = NO;
        sender.selected = YES;
        self.selectBtn = sender;
        
    }
    if (self.areaButton.selected) {
    
    }
}


@end
