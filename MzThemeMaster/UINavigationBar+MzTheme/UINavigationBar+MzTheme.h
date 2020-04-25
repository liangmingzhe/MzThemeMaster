//
//  UINavigationBar+MzTheme.h
//  MzThemeMaster
//
//  Created by 梁明哲 on 2020/4/23.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,NavMode) {
    NavModeDefault = 0,
    NavModeFollowTheme = 1,
};
@interface UINavigationBar (MzTheme)

//如果没有输入主题色，则导航栏将按照系统黑白来决定标题文字的颜色，明亮模式字体黑色，暗黑模式字体白色
- (void)updateWithMode:(NavMode)mode;
@end

NS_ASSUME_NONNULL_END
