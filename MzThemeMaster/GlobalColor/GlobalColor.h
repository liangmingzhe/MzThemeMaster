//
//  GlobalColor.h
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/23.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GlobalColor : NSObject
+ (UIColor *)navigationTextColor;   //默认导航栏标题颜色适配黑暗模式
+ (UIColor *)navigationBarColor;
+ (UIColor *)backgroudColor;

+ (UIColor *)redColor;
+ (UIColor *)whiteColor;
@end

NS_ASSUME_NONNULL_END
