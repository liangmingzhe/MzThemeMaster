//
//  GlobalParams.h
//  MzThemeMaster
//
//  Created by 梁明哲 on 2020/4/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GlobalParams : NSObject
/// 当前横竖屏状态
+ (UIInterfaceOrientation)gerCurrentOrientation;
/// 状态栏高度
+ (CGFloat)statusBarHeight;
/// 导航条高度
+ (CGFloat)navgationBarHeight;
/// 导航高度
+ (CGFloat)navigationHeight;

/// 底部 tabbar高度
+ (CGFloat)tabBarHeight;
/// 底部 tabbar高度 + 安全区可选
+ (CGFloat)tabBarHeightWithSafeAreaInsets:(BOOL)value;
@end

NS_ASSUME_NONNULL_END
