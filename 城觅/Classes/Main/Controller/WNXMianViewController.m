//
//  WNXMianViewController.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXMianViewController.h"
#import "WNXNavigationController.h"
#import "WNXViewController.h"
#import "WNXLeftView.h"

@interface WNXMianViewController ()<UIGestureRecognizerDelegate>
@property (strong, nonatomic) WNXLeftView *leftView;
@property (strong, nonatomic) WNXViewController *showViewcontroller;
@end

@implementation WNXMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *classNames = @[@"WNXHomeViewController",@"WNXFoundViewController",
    @"WNXUserViewController",@"WNXCollectionViewController",@"WNXBeenViewController",@"WNXMessageViewController",@"WNXSettingViewController"];

    [classNames enumerateObjectsUsingBlock:^(NSString *className, NSUInteger idx, BOOL *stop) {
        WNXViewController *vc        = [(WNXViewController *)[NSClassFromString(className) alloc]init];
        WNXNavigationController *nav = [[WNXNavigationController alloc]initWithRootViewController:vc];
        nav.view.layer.shadowColor   = [UIColor blackColor].CGColor;
        nav.view.layer.shadowOffset  = CGSizeMake(-3.5, 0);
        nav.view.layer.shadowOpacity = 0.2;

        [self addChildViewController:nav];
        if (idx == 0) {
            [self.view addSubview:nav.view];
        }
        
       
    }];
    //创建左边的view
    WNXLeftView *view = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([WNXLeftView class]) owner:nil options:nil]lastObject];
    [self.view insertSubview:view atIndex:1];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view.top).offset(40);
        make.bottom.equalTo(self.view.bottom).offset(-20);
        make.width.equalTo(self.view.width).multipliedBy(0.8);
    }];
    
    self.leftView = view;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGFloat movex = [pan translationInView:self.view].x;
    //偏移的比例
    //缩放的最终比例值
    CGFloat zoomScale = (UISCREEN_WITH - WNXScaleTopMargin * 2) / UISCREEN_WITH;
    
    //X最终偏移距离
    CGFloat maxMoveX = UISCREEN_WITH - UISCREEN_WITH * WNXZoomScaleRight;
    if (!self.showViewcontroller.isScale) {
        if (movex <= maxMoveX +5 && movex >= 0) {
            CGFloat scaleXY = 1- movex / maxMoveX *zoomScale;
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleXY, scaleXY);
            self.showViewcontroller.view.transform = CGAffineTransformTranslate(transform, movex, 0);
        }
        if (pan.state == UIGestureRecognizerStateEnded) {
            if (movex > maxMoveX/2) {
                [UIView animateWithDuration:0.03 animations:^{
                    CGAffineTransform transform = CGAffineTransformMakeScale(zoomScale, zoomScale);
                    self.showViewcontroller.view.transform = CGAffineTransformTranslate(transform, maxMoveX, 0);
                } completion:^(BOOL finished) {
                    
                }];
                
            }else{
              [UIView animateWithDuration:0.03 animations:^{
                  self.showViewcontroller.view.transform = CGAffineTransformIdentity;
              }];
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}
@end
