//
//  SVGTestViewController.m
//  MzThemeMaster
//
//  Created by benjaminlmz@qq.com on 2020/4/25.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "SVGTestViewController.h"

@interface SVGTestViewController ()
@property (nonatomic ,strong)UIImageView *testIconView;
@property (nonatomic ,strong)UIImageView *testIcon2View;
@property (nonatomic ,strong)UIImageView *testIcon3View;
@property (nonatomic ,strong) NSMutableArray *colorsArray;
@end

@implementation SVGTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorsArray = [[NSMutableArray alloc] initWithObjects:[UIColor blackColor],[UIColor colorWithRed:0.8 green:0.2 blue:0.2 alpha:1], nil];
    self.testIconView = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth * 0.3 - 80, kHeight/2 - 100, 80, 80)];
    [self.view addSubview:self.testIconView];
    
    self.testIconView.image = [UIImage svgImageNamed:@"chart" withColorArray:self.colorsArray];
    
    self.testIcon2View = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth/2 - 40, kHeight/2 - 100, 80, 80)];
    [self.view addSubview:self.testIcon2View];
    
    self.testIcon2View.image = [UIImage svgImageNamed:@"list" withColorArray:self.colorsArray];
    
    self.testIcon3View = [[UIImageView alloc] initWithFrame:CGRectMake(kWidth* 0.7, kHeight/2 - 100, 80, 80)];
    [self.view addSubview:self.testIcon3View];
    self.testIcon3View.image = [UIImage svgImageNamed:@"man" withColorArray:self.colorsArray];

    for (NSInteger i = 0; i < 6; i++) {
           UIButton *themeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth / (6 + 1) * i * 0.8 + 35, kHeight - 200, 35, 35)];
           [themeBtn setBackgroundColor:[UIColor colorWithRed:(float)(i + 1)* 0.16 green:(float)(i + 1)* 0.03 blue:(float)(i + 1)* 0.05 alpha:1]];
           [self.view addSubview:themeBtn];
           [themeBtn addTarget:self action:@selector(changeSecondLayerColor:) forControlEvents:UIControlEventTouchUpInside];
    }
    for (NSInteger i = 0; i < 6; i++) {
        UIButton *themeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kWidth / (6 + 1) * i * 0.8 + 35, kHeight - 150, 35, 35)];
        [themeBtn setBackgroundColor:[UIColor colorWithRed:(float)(i + 1)* 0.07 green:(float)(i + 1)* 0.18 blue:(float)(i + 1)* 0.2 alpha:1]];
        [self.view addSubview:themeBtn];
        [themeBtn addTarget:self action:@selector(changeSecondLayerColor:) forControlEvents:UIControlEventTouchUpInside];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)changeSecondLayerColor:(UIButton*)sender {
    [self.colorsArray setObject:sender.backgroundColor atIndexedSubscript:1];
    [self imageReload];
    
}

- (void)imageReload {
    self.testIcon3View.image = [UIImage svgImageNamed:@"man" withColorArray:self.colorsArray];
    self.testIcon2View.image = [UIImage svgImageNamed:@"list" withColorArray:self.colorsArray];
    self.testIconView.image = [UIImage svgImageNamed:@"chart" withColorArray:self.colorsArray];
}

@end
