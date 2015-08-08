//
//  WNXViewController.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "WNXSearchViewController.h"
#define WNXScaleDuration 0.3
@interface WNXViewController ()

@end

@implementation WNXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"artcleList_btn_info_6P" target:self action:@selector(leftBarClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"search_icon_white_6P@2x" target:self action:@selector(rightBarClick)];
    self.view.backgroundColor = WNXColor(239, 239, 244);
    // Do any additional setup after loading the view.
}
- (void)leftBarClick{
    _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _coverBtn.frame = self.navigationController.view.frame;
    [_coverBtn addTarget:self action:@selector(beginRemove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_coverBtn];
    CGFloat scaleNumber = (UISCREEN_HEHTH - 2 * WNXScaleTopMargin) / UISCREEN_HEHTH;
    //移动的距离
    if (!self.isScale) {
        CGFloat moveX = UISCREEN_WITH - UISCREEN_WITH * WNXZoomScaleRight;
        [UIView animateWithDuration:WNXScaleDuration animations:^{
            CGAffineTransform transform = CGAffineTransformMakeScale(scaleNumber, scaleNumber);
            self.navigationController.view.transform = CGAffineTransformTranslate(transform, moveX, 0);
            self.isScale = YES;
            
        }];
    }else{
        [UIView animateWithDuration:WNXScaleDuration animations:^{
            self.navigationController.view.transform = CGAffineTransformIdentity;
            self.isScale = NO;
        } completion:^(BOOL finished) {
            [self.coverBtn removeFromSuperview];
            self.coverBtn = nil;
        }];
    }
    
}

- (void)rightBarClick{
    WNXSearchViewController *search = [[WNXSearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
}

- (void)beginRemove{
    [UIView animateWithDuration:WNXScaleDuration animations:^{
        self.navigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
        self.isScale = NO;
        if (_coverRemover) {
            _coverRemover();
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
