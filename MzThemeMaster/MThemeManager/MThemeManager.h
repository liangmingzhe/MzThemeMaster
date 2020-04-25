//
//  MThemeManager.h
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIImage+SVGKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface MThemeManager : NSObject

@property (nonatomic,strong) UIColor *themeImageColor;
@property (nonatomic,strong) UIColor *themeTextColor;

+ (MThemeManager *)sharedInstance;
+ (void)setThemeColor:(UIColor *_Nullable)color;
+ (UIColor *)getThemeTextColor;
+ (UIColor *)getThemeColor;
+ (void)registerVC:(id)object;

@end

NS_ASSUME_NONNULL_END
