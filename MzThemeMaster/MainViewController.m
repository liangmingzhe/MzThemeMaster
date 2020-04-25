//
//  MainViewController.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "MainViewController.h"
#import "TestViewController.h"
#import "FlowThemeViewController.h"
#import "SVGTestViewController.h"
#import "MTabBar.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) MTabBar *tab;
@property (nonatomic,strong) UIButton *theme1Button;
@property (nonatomic,strong) UIButton *theme2Button;
@property (nonatomic,strong) UIButton *theme3Button;
@property (nonatomic,strong) UIButton *theme4Button;

@property (nonatomic,strong) UIButton *navToTestBtn;
@property (nonatomic,strong) UIButton *navToTest2Btn;

@property (nonatomic,strong) UITableView *themeTableView;
@property (nonatomic,strong) NSArray *itemArray;
@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Root";
    self.tab = [[MTabBar alloc] init];
    [self.view addSubview:self.tab];
    [self themeList];
    self.itemArray = [[NSArray alloc] initWithObjects:@"不跟随主题色",@"跟随主题色",@"图标分层变色测试", nil];
    
    self.themeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight - 200) style:UITableViewStylePlain];
    self.themeTableView.delegate = self;
    self.themeTableView.dataSource = self;
    self.themeTableView.backgroundColor = GlobalColor.backgroudColor;
    [self.view addSubview:self.themeTableView];
}


- (void)themeList {
    for (NSInteger i = 0; i < 6; i++) {
        UIButton *themeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth / (6 + 1) * i * 0.8 + 35, kHeight - 200, 35, 35)];
        [themeBtn setBackgroundColor:[UIColor colorWithRed:(float)(i + 1)* 0.2 green:(float)(i + 1)* 0.03 blue:(float)(i + 1)* 0.05 alpha:0.8]];
        [self.view addSubview:themeBtn];
        [themeBtn addTarget:self action:@selector(selectThemeColor:) forControlEvents:UIControlEventTouchUpInside];
    }

    for (NSInteger i = 0; i < 6; i++) {
        UIButton *themeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth / (6 + 1) * i * 0.8 + 35, kHeight - 150, 35, 35)];
        [themeBtn setBackgroundColor:[UIColor colorWithRed:(float)(i + 1)* 0.08 green:(float)(i + 1)* 0.2 blue:(float)(i + 1)* 0.1 alpha:0.8]];
        [self.view addSubview:themeBtn];
        [themeBtn addTarget:self action:@selector(selectThemeColor:) forControlEvents:UIControlEventTouchUpInside];
    }

    UIButton *ntThemeBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, kHeight - 100, kWidth - 100, 35)];
    [ntThemeBtn setBackgroundColor:[UIColor clearColor]];
    [ntThemeBtn setTitle:@"跟随系统" forState:UIControlStateNormal];
    [ntThemeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:ntThemeBtn];
    [ntThemeBtn addTarget:self action:@selector(unSelectThemeColor:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *themeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth - 100,kHeight - 200, 100, 100)];
    themeLabel.text = @"主题色";
    themeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:themeLabel];
}
#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *key = @"itemd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:key];
        cell.textLabel.text = self.itemArray[indexPath.row];
        cell.backgroundColor = GlobalColor.backgroudColor;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TestViewController *vc = [TestViewController new];
        vc.title = self.itemArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){ 
        FlowThemeViewController *vc = [FlowThemeViewController new];
        vc.title = _itemArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        SVGTestViewController *vc = [SVGTestViewController new];
        vc.title = self.itemArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)selectThemeColor:(UIButton *)sender {
    [MThemeManager setThemeColor:sender.backgroundColor];
}
- (void)unSelectThemeColor:(UIButton *)sender {
    [MThemeManager setThemeColor:nil];
}
@end
