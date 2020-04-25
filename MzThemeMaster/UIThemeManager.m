//
//  UIThemeManager.m
//  NavigationTest
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "UIThemeManager.h"

@implementation UIThemeManager
static UIThemeManager *manager = nil;
static dispatch_once_t onceToken;

+ (void)load {
    dispatch_once(&onceToken, ^{
        manager = [[UIThemeManager alloc] init];
        manager.themeImageColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.4 alpha:1];
        manager.themeTextColor = [UIColor whiteColor];
        [manager addObserver:manager forKeyPath:@"themeColor" options:NSKeyValueObservingOptionNew context:nil];
    });
}

+ (UIThemeManager *)sharedInstance {
    dispatch_once(&onceToken, ^{
        manager = [[UIThemeManager alloc] init];
        manager.themeImageColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.4 alpha:1];
        [manager addObserver:manager forKeyPath:@"themeColor" options:NSKeyValueObservingOptionNew context:nil];
    });
    return manager;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == manager) {
        if ([keyPath isEqualToString:@"themeColor"]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"themeChanged" object:nil userInfo:@{@"key":@"_obj0"}];
        }
    }
}
- (void)dealloc {
    [manager removeObserver:manager forKeyPath:@"themeColor"];
}


@end
