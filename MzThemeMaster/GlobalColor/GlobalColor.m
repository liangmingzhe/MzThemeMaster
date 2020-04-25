//
//  GlobalColor.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/23.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "GlobalColor.h"

#define UIColorFromRGB(rgbValue) ([UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0])

@implementation GlobalColor
+ (UIColor *)navigationTextColor {
    if (@available(iOS 13.0, *)) {
       return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trait) {
           if (trait.userInterfaceStyle == UIUserInterfaceStyleDark) {
               return UIColorFromRGB(0xFDFDFD);
           } else {
               return UIColorFromRGB(0x333333);
           }
        }];
    } else {
        //iOS 13以下勿需适配黑暗模式
        return UIColorFromRGB(0xFDFDFD);
    }
}
+ (UIColor *)navigationBarColor {
    if (@available(iOS 13.0, *)) {
       return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trait) {
           if (trait.userInterfaceStyle == UIUserInterfaceStyleDark) {
               return UIColorFromRGB(0x222222);
           } else {
               return UIColorFromRGB(0xFDFDFD);
           }
        }];
    } else {
        //iOS 13以下勿需适配黑暗模式
        return UIColorFromRGB(0x222222);
    }
}
//背景颜色
+ (UIColor *)backgroudColor {
    if (@available(iOS 13.0, *)) {
       return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trait) {
           if (trait.userInterfaceStyle == UIUserInterfaceStyleDark) {
               return UIColorFromRGB(0x222222);
           } else {
               return UIColorFromRGB(0xFDFDFD);
           }
        }];
    } else {
        //iOS 13以下勿需适配黑暗模式
        return UIColorFromRGB(0xFDFDFD);
    }
}

+ (UIColor *)redColor {
    return UIColorFromRGB(0xF00000);
}
+ (UIColor *)whiteColor {
    return UIColorFromRGB(0xFFFFFF);
}

@end
