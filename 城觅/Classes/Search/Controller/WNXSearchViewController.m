//
//  WNXSearchViewController.m
//  WNXhuntCity2
//
//  Created by isoftstone on 15/8/4.
//  Copyright (c) 2015年 isoftstone. All rights reserved.
//

#import "WNXSearchViewController.h"
#import "WNXSearchTextField.h"
#import "UIBarButtonItem+Extension.h"
#import "WNXHistoryCell.h"
#import "WNXHotCellTableViewCell.h"
#define WNXSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]
@interface WNXSearchViewController()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)WNXSearchTextField *searchTextField;
@property (strong, nonatomic) NSArray *mainHotData;
@property (strong, nonatomic) NSMutableArray *mainHistory;
@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) UITableView *tableView;
@end
@implementation WNXSearchViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self setUpNav];
    [self setUpUI];
}

- (NSMutableArray *)mainHistory{
    if (!_mainHistory) {
        _mainHistory = [NSMutableArray arrayWithContentsOfFile:WNXSearchHistoryPath];
        if (!_mainHistory) {
            _mainHistory = [NSMutableArray arrayWithObjects:@"面条点", nil];
        }
    }
    return _mainHistory;
}

- (NSArray *)mainHotData{
    if (!_mainHotData) {
        _mainHotData = @[@"下午茶",@"火锅",@"温泉",@"杭州"];
    }
    return _mainHotData;
}

- (void)setUpUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}
- (void)setUpNav{
    
    WNXSearchTextField *searchBar = [[WNXSearchTextField alloc]
                                     init];
    CGFloat w = self.view.bounds.size.width * 0.7;
    searchBar.frame = CGRectMake(0, 0, w, 30);
    searchBar.delegate = self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBar];
    self.searchTextField = searchBar;
    
    
//取消
    UIBarButtonItem *rightItem = [UIBarButtonItem initWithNormalTitle:@"取消" target:self action:@selector(cancle) titleColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
        if (self.mainHistory.count) {
            [_data addObject:self.mainHistory];
        }
        [_data addObject:self.mainHotData];
    }
    return _data;
}
- (void)cancle{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.data.count == 2) {
        if (section == 0) {
            return [self.data[0] count];
        }else{
            return 1;
        }
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.data.count ==2 && indexPath.section == 0 && self.mainHistory.count) {
        WNXHotCellTableViewCell *cell = [WNXHotCellTableViewCell cellforTableview:self.tableView indexPath:indexPath hotArray:self.mainHistory];
        cell.hotLable.text = self.mainHistory[indexPath.row];
        return cell;
    }else{
        WNXHistoryCell *cell = [WNXHistoryCell hotCellWithHotData:self.mainHotData];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.text.length) {
        for (NSString *text in self.mainHistory) {
            if ([text isEqualToString:textField.text]) {
                return YES;
            }
        }
        [self.mainHistory addObject:textField.text];
        [self.mainHistory writeToFile:WNXSearchHistoryPath atomically:YES];
        [self.tableView reloadData];
        textField.text = @"";
        
    }
    return YES;
}
@end
