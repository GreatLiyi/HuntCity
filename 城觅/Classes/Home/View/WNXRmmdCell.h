//
//  WNXRmmdCell.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNXHomeCellModel.h"
@interface WNXRmmdCell : UITableViewCell
@property (strong, nonatomic) WNXHomeCellModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView model:(WNXHomeCellModel *)model;
@end
