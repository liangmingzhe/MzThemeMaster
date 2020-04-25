//
//  MThemeManager.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "MThemeManager.h"
#import <objc/runtime.h>
@interface MThemeManager()
@property (nonatomic ,strong)NSMutableArray *notifyArray;
@end
@implementation MThemeManager
static MThemeManager *manager = nil;
static dispatch_once_t onceToken;

+ (void)load {
    dispatch_once(&onceToken, ^{
        manager = [[MThemeManager alloc] init];
        [manager addObserver:manager forKeyPath:@"themeImageColor" options:NSKeyValueObservingOptionNew context:nil];
        manager.notifyArray = [[NSMutableArray alloc] initWithCapacity:0];
    });
}

+ (void)registerVC:(UIViewController *)object {
    if (object == nil) {
        return;
    }

    @synchronized (manager.notifyArray) {
        for (NSString *value in manager.notifyArray){
            if ([value isEqualToString:[NSString stringWithFormat:@"%s",object_getClassName(object)]])
                return ;
        }
        [manager.notifyArray addObject:[NSString stringWithFormat:@"%s",object_getClassName(object)]];
        NSLog(@"");
    }
}

+(void)registerTabBar:(UITabBar *)object {
    
}
+ (void)unregisterVC:(id)object{
    if (object == nil) {
        return;
    }
    @synchronized (manager.notifyArray) {
        for (NSString *value in manager.notifyArray){
            if ([value isEqualToString:[NSString stringWithFormat:@"%s",object_getClassName(object)]])
                [manager.notifyArray removeObject:[NSString stringWithFormat:@"%s",object_getClassName(object)]];
            NSLog(@"");
        }
    }
}

+ (MThemeManager *)sharedInstance {
    dispatch_once(&onceToken, ^{
        manager = [[MThemeManager alloc] init];
        manager.themeImageColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.4 alpha:1];
        manager.themeTextColor = GlobalColor.whiteColor;
        [manager addObserver:manager forKeyPath:@"themeImageColor" options:NSKeyValueObservingOptionNew context:nil];
    });
    return manager;
}
+ (UIColor *)getThemeColor {
    return manager.themeImageColor;
}

+ (UIColor *)getThemeTextColor {
    
    return manager.themeTextColor != nil?manager.themeTextColor:[UIColor whiteColor];
}
+ (void)setThemeColor:(UIColor *)color {
    manager.themeTextColor = [UIColor whiteColor];
    manager.themeImageColor = color;
}
//  建立一个KVO监听 color变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == manager) {
        //进行两层for循环遍历
        [manager.notifyArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *controllerName = [NSString stringWithFormat:@"%@",obj];
            NSArray *controllersArray = [[[UIApplication sharedApplication].windows firstObject].rootViewController childViewControllers];
            [controllersArray enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [[NSString stringWithFormat:@"%s",object_getClassName(obj)] isEqualToString:controllerName];
                if([MThemeManager getThemeColor] == nil) {
                    [obj.navigationController.navigationBar updateWithMode:NavModeDefault];
                }else {
                    [obj.navigationController.navigationBar updateWithMode:NavModeFollowTheme];
                }
            }];
        }];
        if ([keyPath isEqualToString:@"themeImageColor"]) {
            if (manager.themeImageColor == nil) {
                //发送这个通知代表将采用系统的原来的颜色
                [[NSNotificationCenter defaultCenter] postNotificationName:@"themeChanged" object:nil userInfo:nil];
            }else {
                //发送这个通知代表主题色切换
                [[NSNotificationCenter defaultCenter] postNotificationName:@"themeChanged" object:@{@"color":manager.themeImageColor} userInfo:nil];
            }

        }
    }
}

- (void)dealloc {
    [manager removeObserver:manager forKeyPath:@"themeImageColor"];
}
@end
