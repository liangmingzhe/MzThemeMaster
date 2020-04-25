//
//  FlowThemeViewController.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/24.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "FlowThemeViewController.h"

@interface FlowThemeViewController ()

@end

@implementation FlowThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MThemeManager registerVC:self];
    [self.navigationController.navigationBar updateWithMode:NavModeFollowTheme];
    self.view.backgroundColor = GlobalColor.backgroudColor;
}

@end
