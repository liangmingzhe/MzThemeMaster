//
//  ViewController.m
//  svgIconTest
//
//  Created by benjaminlmz@qq.com on 2020/4/7.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "ViewController.h"
#import <SVGKit/SVGKit.h>
#import "UIImage+SVGKit.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
{
    NSMutableArray *theme1;
    NSMutableArray *theme2;
    NSMutableArray *theme3;
    int themeIndex;
}

@property (nonatomic ,strong)UIImageView *imageView1;
@property (nonatomic ,strong)UIImageView *imageView2;
@property (nonatomic ,strong)UIImageView *imageView3;
@property (nonatomic ,strong)UIImageView *imageView4;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//     Do any additional setup after loading the view.
    //主题色
        // 蓝 + 灰
    theme1 = [@[
        [UIColor colorWithDisplayP3Red:0.3 green:0.3 blue:0.6 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.4 blue:0.8 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.4 blue:0.8 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.4 blue:0.8 alpha:0.8]
    ] mutableCopy];
        // 红 + 灰
    theme2 = [@[
        [UIColor colorWithDisplayP3Red:0.3 green:0.3 blue:0.3 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.9 green:0.3 blue:0.1 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.9 green:0.3 blue:0.1 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.9 green:0.3 blue:0.1 alpha:0.8]
    ] mutableCopy];
    theme3 = [@[
        [UIColor colorWithDisplayP3Red:0.2 green:0.6 blue:0.3 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.6 blue:0.3 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.6 blue:0.3 alpha:0.8],
        [UIColor colorWithDisplayP3Red:0.2 green:0.6 blue:0.3 alpha:0.8]
    ] mutableCopy];
    
    [UIImage setThemeWithArray:theme1];
    themeIndex = 1;
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5 - 40, HEIGHT / 6, 80, 80)];
    self.imageView1.image = [UIImage svgImageNamed:@"tubiao-0"];
    [self.view addSubview:self.imageView1];

    
    self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5*2 - 40, HEIGHT / 6, 80, 80)];
    self.imageView2.image = [UIImage svgImageNamed:@"tubiao-1"];
    [self.view addSubview:self.imageView2];


    self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5 * 3 - 40, HEIGHT / 6, 80, 80)];
    self.imageView3.image = [UIImage svgImageNamed:@"tubiao-2"];
    [self.view addSubview:self.imageView3];

    self.imageView4 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/5 * 4 - 40, HEIGHT / 6, 80, 80)];
    self.imageView4.image = [UIImage svgImageNamed:@"tubiao-3"];
    [self.view addSubview:self.imageView4];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 - 150, HEIGHT /2 - 100, 300, 45)];
    [button setTitle:@"当前主题 - 点击切换" forState:UIControlStateNormal];
    [button setBackgroundColor:theme1[1]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeTheme:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)changeTheme:(UIButton *)sender {
    if (themeIndex == 1) {
        themeIndex ++;
        [UIImage setThemeWithArray:theme2];
        [sender setBackgroundColor:theme2[1]];
    }
    else if (themeIndex == 2) {
        themeIndex ++;
        [UIImage setThemeWithArray:theme3];
        [sender setBackgroundColor:theme3[1]];
    }
    else if (themeIndex == 3) {
        themeIndex = 1;
        [UIImage setThemeWithArray:theme1];
        [sender setBackgroundColor:theme1[1]];
        
    }

    self.imageView1.image = [UIImage svgImageNamed:@"tubiao-0"];
    self.imageView2.image = [UIImage svgImageNamed:@"tubiao-1"];
    self.imageView3.image = [UIImage svgImageNamed:@"tubiao-2"];
    self.imageView4.image = [UIImage svgImageNamed:@"tubiao-3"];
    
    
}
@end
