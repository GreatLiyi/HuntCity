//
//  WNXViewController.h
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^coverDidRemove)();
@interface WNXViewController : UIViewController
@property (strong, nonatomic) UIButton *coverBtn;
@property (copy, nonatomic)coverDidRemove coverRemover;
@property (assign, nonatomic) BOOL isScale;
- (void)leftBarClick;
- (void)rightBarClick;
@end
