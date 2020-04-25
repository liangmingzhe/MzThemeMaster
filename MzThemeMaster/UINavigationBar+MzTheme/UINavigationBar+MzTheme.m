//
//  UINavigationBar+MzTheme.m
//  MzThemeMaster
//
//  Created by 梁明哲 on 2020/4/23.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "UINavigationBar+MzTheme.h"

#import <objc/runtime.h>


@implementation UINavigationBar (MzTheme)
//更新导航栏样式
- (void)updateWithMode:(NavMode)mode {
    if (mode == NavModeDefault) {
        //主题文字颜色
        [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:GlobalColor.navigationTextColor}]; //导航栏标题色
        [self setTintColor:GlobalColor.navigationTextColor];
        [self setBarTintColor:GlobalColor.navigationBarColor]; //导航栏背景色
    }else {
        [self setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[MThemeManager getThemeColor] != nil?[MThemeManager getThemeTextColor]:GlobalColor.navigationTextColor}];
        [self setTintColor:[MThemeManager getThemeColor] != nil?[MThemeManager getThemeTextColor]:GlobalColor.navigationTextColor];
        [self setBarTintColor:[MThemeManager getThemeColor] != nil?[MThemeManager getThemeColor]:GlobalColor.navigationBarColor];
    }
    
}


@end
