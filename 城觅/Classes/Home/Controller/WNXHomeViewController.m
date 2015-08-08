//
//  WNXHomeViewController.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXHomeViewController.h"
#import "WNXRmmdCell.h"
#import "WNXRmndHeadView.h"
#import "WNXHomeCellModel.h"
#import "WNXDetailViewController.h"
#import "WNXHeadPushViewController.h"
@interface WNXHomeViewController()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *rmedView;
@property (strong, nonatomic) UIImageView *nearByView;

@property (strong, nonatomic) NSMutableArray *headModels;//headmodel的模型
@property (strong, nonatomic) NSMutableArray *datas;//home的模型
@property (strong, nonatomic) NSMutableArray *cellDatas;//cell的模型
@end
@implementation WNXHomeViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self setUpNav];
    [self setUI];
}

//懒加载
- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
        NSArray *tempArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"HomeDatas" ofType:@"plist"]];
        [tempArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
            WNXHomeModel *model = [WNXHomeModel homeModelWithDict:obj];
            [_datas addObject:model];
        }];
    }
    return _datas;
}
- (void)setUpNav{
    //设置导航条titleView
    UISegmentedControl *titleV = [[UISegmentedControl alloc] initWithItems:@[@"推荐", @"附近"]];

    titleV.tintColor = WNXColor(26, 163, 146);
    titleV.frame = CGRectMake(0, 0, self.view.bounds.size.width * 0.5, 30);
    //文字设置
    NSMutableDictionary *attDic = [NSMutableDictionary dictionary];
    attDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateNormal];
    [titleV setTitleTextAttributes:attDic forState:UIControlStateSelected];
    //事件
    titleV.selectedSegmentIndex = 0;
    [titleV addTarget:self action:@selector(titleViewChange:) forControlEvents:UIControlEventValueChanged];
//    self.navigationItem.titleView = titleV;
//    self.segement = titleV;
//    self.navigationItem.titleView = self.segement;
    _segement = titleV;
    self.navigationItem.titleView = _segement;
    NSLog(@"%@",self.navigationItem.titleView);
}

- (void)titleViewChange:(UISegmentedControl *)index{
    if (index.selectedSegmentIndex == 0) {
        [self.view addSubview:self.rmedView];
        [self.nearByView removeFromSuperview];
    }else{
        [self.view addSubview:self.nearByView];
        [self.rmedView removeFromSuperview];
    }
}
- (void)setUI{
    self.view.backgroundColor = WNXColor(51, 52, 53);
    UITableView *tablev = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WITH, UISCREEN_HEHTH-64)style:UITableViewStylePlain];
    tablev.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.rmedView = tablev;
    self.rmedView.delegate = self;
    self.rmedView.dataSource = self;
    [self.view addSubview:self.rmedView];
    
    //附近
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"wnxBG"];
    self.nearByView = imageView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WNXHomeModel *model = self.datas[section];
    return model.body.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WNXHomeModel *model = self.datas[section];
    WNXRmndHeadView *head = [WNXRmndHeadView headViewWithModel:model];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeadView:)];
    [head addGestureRecognizer:tap];
    return head;
}
- (void)tapHeadView:(UIGestureRecognizer *)tap{
    WNXRmndHeadView *head = (WNXRmndHeadView *)tap.view;
    WNXHomeModel *model = head.model;
    WNXHeadPushViewController *headVC = [[WNXHeadPushViewController alloc]init];
    headVC.model = model;
    [self.navigationController pushViewController:headVC animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WNXHomeModel *homeModel = self.datas[indexPath.section];
    
    WNXHomeCellModel *model = [WNXHomeCellModel cellModelWithDict:(NSDictionary *)homeModel.body[indexPath.row]];
    WNXRmmdCell *cell = [WNXRmmdCell cellWithTableView:tableView model:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    WNXDetailViewController *detail = [[WNXDetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return WNXRnmdCellHeight;
}

@end
