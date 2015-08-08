//
//  WNXHistoryCell.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXHistoryCell.h"
@interface WNXHistoryCell()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@end
@implementation WNXHistoryCell

- (void)awakeFromNib {
    // Initialization code
    [self setUpBtn:self.btn1];
    [self setUpBtn:self.btn2];
    [self setUpBtn:self.btn3];
    [self setUpBtn:self.btn4];
    [self.btn2 setBackgroundColor:self.btn1.backgroundColor];
    [self.btn3 setBackgroundColor:self.btn1.backgroundColor];
    [self.btn4 setBackgroundColor:self.btn1.backgroundColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setUpBtn:(UIButton *)btn{
    btn.layer.masksToBounds = YES;
    CGFloat corner = btn.frame.size.height/2 * 0.95;
    btn.layer.cornerRadius = corner;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setHotDatas:(NSArray *)hotDatas{
    _hotDatas = hotDatas;
    if (hotDatas.count == 4) {
        [self.btn1 setTitle:hotDatas[0] forState:UIControlStateNormal];
        [self.btn2 setTitle:hotDatas[1] forState:UIControlStateNormal];
        [self.btn3 setTitle:hotDatas[2] forState:UIControlStateNormal];
        [self.btn4 setTitle:hotDatas[3] forState:UIControlStateNormal];
    }
    [self layoutIfNeeded];
    
    //算出间距
    CGFloat margin = (UISCREEN_WITH - 40 - self.btn1.bounds.size.width - self.btn2.bounds.size.width - self.btn3.bounds.size.width - self.btn4.bounds.size.width) / 3;
    [self.btn2 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn1.right).offset(margin);
    }];
    [self.btn3 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn2).offset(margin);
    }];
    [self.btn4 updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn3).offset(margin);
    }];
    
}

+(instancetype)hotCellWithHotData:(NSArray *)hotData{
    WNXHistoryCell *cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
    cell.hotDatas = hotData;
    return cell;
}
@end
