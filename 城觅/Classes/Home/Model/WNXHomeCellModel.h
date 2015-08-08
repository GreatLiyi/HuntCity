//
//  WNXHomeCellModel.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WNXHomeCellModel : NSObject
/** cellTitle */
@property (copy ,nonatomic) NSString *section_title;
/** 图片地址 */
@property (copy, nonatomic) NSString *imageURL;
/** 浏览次数 */
@property (copy, nonatomic) NSString *fav_count;
/** 底部名称 */
@property (copy, nonatomic) NSString *poi_name;

+ (instancetype)cellModelWithDict:(NSDictionary *)dic;
@end
