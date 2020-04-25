//
//  AppDelegate.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/22.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:[MainViewController new]];
    self.window.rootViewController = nv;
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
