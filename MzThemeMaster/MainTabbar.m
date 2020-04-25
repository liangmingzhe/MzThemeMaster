//
//  MainTabbar.m
//  NavigationTest
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "MainTabbar.h"
#import "UIThemeManager.h"
#import "UIImage+SVGKit.h"
@implementation MainTabbar
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, frame.origin.y, [UIScreen mainScreen].bounds.size.width, 80)];
    if (self) {
        [self initUI];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandle:) name:@"themeChanged" object:nil];
    }
    return self;
}

- (void)initUI{
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"测试3" image:[UIImage svgImageNamed:@"wuliu" size:CGSizeMake(40, 40)] tag:0];
    
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"测试2" image:[UIImage svgImageNamed:@"delete" size:CGSizeMake(40, 40)] selectedImage:[[UIImage svgImageNamed:@"delete" size:CGSizeMake(40, 40)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"测试3" image:[UIImage svgImageNamed:@"bao" size:CGSizeMake(40, 40)] selectedImage:[[UIImage svgImageNamed:@"bao" size:CGSizeMake(40, 40)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self setItems:[NSArray arrayWithObjects:item1,item2,item3, nil]];
    self.tintColor = [UIThemeManager sharedInstance].themeImageColor;
    [self setSelectedItem:item1];
    

}

- (void)updateThemeColor {
    self.tintColor = [UIThemeManager sharedInstance].themeImageColor;
}
- (void)notificationHandle:(id)sender {
    [self updateThemeColor];
}
@end
