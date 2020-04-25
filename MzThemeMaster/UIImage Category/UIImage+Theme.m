//
//  UIImage+Theme.m
//  NavigationTest
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "UIImage+Theme.h"

@implementation UIImage (Theme)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
