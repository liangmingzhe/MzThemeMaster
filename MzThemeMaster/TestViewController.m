//
//  TestViewController.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/24.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar updateWithMode:NavModeDefault];    //不跟随主题色
    self.view.backgroundColor = GlobalColor.backgroudColor;

}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar updateWithMode:NavModeFollowTheme]; //隐藏后恢复跟随主题色
}



@end
