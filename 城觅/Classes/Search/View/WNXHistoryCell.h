//
//  WNXHistoryCell.h
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNXHistoryCell : UITableViewCell
@property (strong, nonatomic) NSArray *hotDatas;
+ (instancetype)hotCellWithHotData:(NSArray *)hotData;
@end
