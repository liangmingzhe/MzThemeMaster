//
//  MzMethod.h
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/23.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MzMethod : NSObject
+ (UIImage *)imageWithColor:(UIColor * _Nullable)color size:(CGSize)size;

+ (NSString *)hexStringFromColor:(UIColor *)color;

+ (UIColor *)colorWithHexString:(NSString *)color;
@end

NS_ASSUME_NONNULL_END
