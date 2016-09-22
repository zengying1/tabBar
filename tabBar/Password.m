//
//  Password.m
//  tabBar
//
//  Created by 1808 on 15/11/27.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "Password.h"

@interface Password ()

@end

@implementation Password

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb =[[UILabel alloc]initWithFrame:CGRectMake(120, 120, 100, 100)];
    lb.text = @"密码";
    [self.view addSubview:lb];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
