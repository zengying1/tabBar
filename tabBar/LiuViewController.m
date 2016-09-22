//
//  LiuViewController.m
//  tabBar
//
//  Created by Oreal51 on 16/3/7.
//  Copyright © 2016年 1808. All rights reserved.
//

#import "LiuViewController.h"

@interface LiuViewController ()

@end

@implementation LiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 200, 200)];
    lab.text = @"zengying";
    [self.view addSubview:lab];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
