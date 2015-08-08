//
//  WNXHotCellTableViewCell.m
//  城觅
//
//  Created by isoftstone on 15/8/6.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXHotCellTableViewCell.h"
#define WNXSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]
@interface WNXHotCellTableViewCell()

@property (weak, nonatomic) UITableView *tableview;
@property (weak, nonatomic) NSIndexPath *indexPath;
@property (strong ,nonatomic) NSMutableArray *hotArray1;
@end
@implementation WNXHotCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)delect:(id)sender {
    
    [self.hotArray1 removeObjectAtIndex:self.indexPath.row];
    [self.hotArray1 writeToFile:WNXSearchHistoryPath atomically:YES];
    [self.tableview deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableview reloadData];
    });
}

+(instancetype)cellforTableview:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath hotArray:(NSMutableArray *)hotArray{
    NSString *ID = @"reuseIdentycellID";
    WNXHotCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    }
    cell.hotArray1  = hotArray;
    cell.tableview = tableView;
    cell.indexPath = indexPath;
    return cell;
}
@end
