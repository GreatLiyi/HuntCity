//
//  WNXLeftView.h
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXLeftButtonType){
    WNXLeftButtonTypeHome = 0,
    WNXLeftButtonTypeFound,
    WNXLeftButtonTypeIcon,
    WNXLeftButtonTypeSina,
    WNXLeftButtonTypeWeiXin,
    WNXLeftButtonTypeMessage,
    WNXLeftButtonTypeSetting
};
@protocol WNXLeftViewDelegte <NSObject>

@optional

//左边按钮被点击的时候调用
- (void)leftMenuViewButtonClickFrom:(WNXLeftButtonType)fromIndex to:(WNXLeftButtonType)toIndex;

@end
@interface WNXLeftView : UIView
@property (weak, nonatomic) id <WNXLeftViewDelegte>delegate;
@end
