//
//  WNXRmndHeadView.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXHomeModel.h"
@interface WNXRmndHeadView : UIView
@property (strong, nonatomic) WNXHomeModel *model;
+ (instancetype)headViewWithModel:(WNXHomeModel *)model;
@end
