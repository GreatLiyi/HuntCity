//
//  WNXNavigationController.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXNavigationController.h"

@interface WNXNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation WNXNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = nil;
    self.interactivePopGestureRecognizer.enabled = NO;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    // Do any additional setup after loading the view.
}

+ (void)initialize{
//    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self , nil];
    [bar setBackgroundImage:[UIImage imageNamed:@"recomend_btn_gone"] forBarMetrics:UIBarMetricsDefault];
    //去掉导航条的透明
    bar.translucent = YES;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    bar.titleTextAttributes = dict;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return (self.topViewController != [self.viewControllers firstObject]);
}
@end
