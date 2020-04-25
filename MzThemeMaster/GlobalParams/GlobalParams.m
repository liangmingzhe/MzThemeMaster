//
//  GlobalParams.m
//  MzThemeMaster
//
//  Created by 梁明哲 on 2020/4/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "GlobalParams.h"
#define kIsBangsScreen ({\
    BOOL isBangsScreen = NO; \
    if (@available(iOS 11.0, *)) { \
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
    isBangsScreen = window.safeAreaInsets.bottom > 0; \
    } \
    isBangsScreen; \
})


@implementation GlobalParams

+ (UIInterfaceOrientation)gerCurrentOrientation {
    return [[[UIApplication sharedApplication] windows] firstObject].windowScene.interfaceOrientation;
}
+ (CGFloat)statusBarHeight {
    return kIsBangsScreen == YES?44:20;
}
+ (CGFloat)navgationBarHeight {
    if ([GlobalParams gerCurrentOrientation] == UIDeviceOrientationPortrait || [GlobalParams gerCurrentOrientation] == UIDeviceOrientationPortraitUpsideDown) {
        //当前竖屏
        return 44;
    } else {
       //当前横屏
        return 0;
    }
    
}

+ (CGFloat)navigationHeight {
    if ([GlobalParams gerCurrentOrientation] == UIDeviceOrientationPortrait || [GlobalParams gerCurrentOrientation] == UIDeviceOrientationPortraitUpsideDown) {
        //当前竖屏
        return [GlobalParams navgationBarHeight] + [GlobalParams statusBarHeight];
    } else {
       //当前横屏
        return [GlobalParams navgationBarHeight] + [GlobalParams statusBarHeight];
    }
}

+ (CGFloat)tabBarHeightWithSafeAreaInsets:(BOOL)value {
    if (value == YES) {
        return kIsBangsScreen == YES ? 49.0 + 34.0: 49.0;
    }else {
        return 49.0;
    }
}

+ (CGFloat)tabBarHeight {
    return 49.0;
}

@end
