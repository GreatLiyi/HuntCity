//
//  WNXHomeModel.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WNXHomeModel : NSObject
/** headView的颜色 */
@property (copy, nonatomic) NSString *color;
/** headView的title */
@property (copy, nonatomic) NSString *tag_name;
/** headView的subTitle */
@property (copy, nonatomic) NSString *section_count;
/** cell模型 */
@property (strong, nonatomic) NSArray *body;

+ (instancetype)homeModelWithDict:(NSDictionary *)dict;
@end
