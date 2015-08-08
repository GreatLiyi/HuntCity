//
//  WNXHomeModel.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXHomeModel.h"
#import <MJExtension.h>
@implementation WNXHomeModel
+(instancetype)homeModelWithDict:(NSDictionary *)dict{
    WNXHomeModel *model = [[self alloc]init];
    [model setKeyValues:dict];
    return model;
}
@end
