//
//  WNXRmmdCell.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXRmmdCell.h"
#import <UIImageView+WebCache.h>
@interface WNXRmmdCell()
@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *likeLable;


@end
@implementation WNXRmmdCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = WNXColor(51, 52, 53);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView model:(WNXHomeCellModel *)model{
   NSString *ID = @"WNXRmmdCellID";
    WNXRmmdCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
        
    }
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:model.imageURL] placeholderImage:[UIImage imageNamed:@"EXP_likeList_backImage6"]];
    cell.title.text = model.section_title;
    cell.subTitle.text = model.poi_name;
    cell.likeLable.text = model.fav_count;
    return cell;
}
@end
