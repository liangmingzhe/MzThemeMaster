//
//  MBaseViewController.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "MBaseViewController.h"

@interface MBaseViewController ()
@end

@implementation MBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [MThemeManager registerVC:self];
    [self.navigationController.navigationBar updateWithMode:NavModeFollowTheme];
    self.view.backgroundColor = GlobalColor.backgroudColor;
}

- (void)dealloc {

}
@end
