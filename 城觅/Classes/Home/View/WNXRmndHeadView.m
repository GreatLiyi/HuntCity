//
//  WNXRmndHeadView.m
//  城觅
//
//  Created by isoftstone on 15/8/7.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXRmndHeadView.h"
#import "UIColor+Extension.h"
@interface WNXRmndHeadView()
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end
@implementation WNXRmndHeadView

+ (instancetype)headViewWithModel:(WNXHomeModel *)model{
    WNXRmndHeadView *head = [[WNXRmndHeadView alloc]init];
    head.model = model;
    return head;
}

-(void)setModel:(WNXHomeModel *)model{
    _model = model;
    self.bigTitle.text = model.tag_name;
    self.subTitle.text = model.section_count;
    self.backgroundColor = [UIColor colorWithHexString:model.color alpha:1];


}
@end
