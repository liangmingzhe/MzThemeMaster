//
//  UIImage+SVGKit.h
//  svgIconTest
//
//  Created by benjaminlmz@qq.com on 2020/4/7.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SVGKit)

/// 单纯加载svg图片
/// @param name 图片名
+ (UIImage *)svgImageNamed:(NSString *)name;

/// 加载svg图片，用16进制色值修改颜色
/// @param name 图片名
/// @param imgv 显示的UIImageView
/// @param hexColor 16进制色值
+ (UIImage *)svgImageNamed:(NSString *)name imgv:(UIImageView *)imgv hexColor:(NSString *)hexColor;

/// 加载svg图片，用色值对象修改颜色
/// @param name 图片名
/// @param imgv 显示的UIImageView
/// @param objColor 色值对象
+ (UIImage *)svgImageNamed:(NSString *)name imgv:(UIImageView *)imgv objColor:(UIColor *)objColor;

//设置分层渲染的数组
+ (void)setThemeWithArray:(NSArray<UIColor*>*)array;

@property (nonatomic,strong) NSMutableArray <UIColor *> *themeArray;
@end

NS_ASSUME_NONNULL_END
