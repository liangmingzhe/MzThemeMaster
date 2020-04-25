//
//  MTabBar.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "MTabBar.h"
@implementation MTabBar
- (id)init{
    self = [super initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [GlobalParams tabBarHeightWithSafeAreaInsets:YES], [UIScreen mainScreen].bounds.size.width, [GlobalParams tabBarHeight])];
    if (self) {
        [self initUI];
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandle:) name:@"themeChanged" object:nil];
    }
    return self;
}

- (void)initUI{
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"测试1" image:[[UIImage svgImageNamed:@"wuliu" size:CGSizeMake(33, 33)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"测试2" image:[UIImage svgImageNamed:@"bao" size:CGSizeMake(33, 33)] tag:0];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"测试3" image:[UIImage svgImageNamed:@"delete" size:CGSizeMake(33, 33)] tag:0];
    [self setItems:[NSArray arrayWithObjects:item1,item2,item3, nil]];
    [self setSelectedItem:item1];//默认选中
    [self setTintColor:[MThemeManager getThemeColor]];//选中颜色
    if (@available(iOS 13.0, *)) {
        self.unselectedItemTintColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.8];
            } else {
                 return [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.6];
            }
        }];
    } else {
        self.unselectedItemTintColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.6];
    }
}
- (void)notificationHandle:(NSNotification *)sender {
    if(sender.object == nil) {
        [self updateThemeWithColor:[UIColor blueColor]];
    }else {
        UIColor *color = sender.object[@"color"];
        [self updateThemeWithColor:color];
    }

    
}

- (void)statusBarOrientationChange:(NSNotification *)sender {
    UIDeviceOrientation orient = [UIDevice currentDevice].orientation;
    if (orient == UIDeviceOrientationPortrait) {
        [self setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [GlobalParams tabBarHeightWithSafeAreaInsets:YES], [UIScreen mainScreen].bounds.size.width, 49)];

    }else {
        [self setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49)];
    }

}

//更新tabbar选中颜色
- (void)updateThemeWithColor:(UIColor *)color {
    
    self.tintColor = color;
}
@end
