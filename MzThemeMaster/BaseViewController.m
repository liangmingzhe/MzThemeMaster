//
//  BaseViewController.m
//  NavigationTest
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "BaseViewController.h"
#import "UIThemeManager.h"
#import "UIImage+Theme.h"
@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateThemeColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandle:) name:@"themeChanged" object:nil];
}

- (void)updateThemeColor {
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageWithColor:[UIThemeManager sharedInstance].themeImageColor size:self.navigationController.navigationBar.bounds.size];
    [self.navigationController.navigationBar setBackgroundImage:image forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    
//    self.navigationController.navigationBar.titleTextAttributes
    
//    [[[UITabBarItem appearance] setTitleTextAttributes: forState:UIControlStateNormal];
//    themeImageColor
}
- (void)notificationHandle:(id)sender {
    [self updateThemeColor];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:@"themeChanged"];
}
@end
