//
//  WNXHomeCellModel.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXHomeCellModel.h"
#import <MJExtension.h>
@implementation WNXHomeCellModel
+(instancetype)cellModelWithDict:(NSDictionary *)dic{
    WNXHomeCellModel *model = [[self alloc]init];
    [model setKeyValues:dic];
    return model;
}
@end
