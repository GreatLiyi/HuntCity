//
//  WNXHotCellTableViewCell.h
//  城觅
//
//  Created by isoftstone on 15/8/6.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNXHotCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *hotLable;
+ (instancetype )cellforTableview:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath hotArray:(NSMutableArray *)hotArray;
@end
