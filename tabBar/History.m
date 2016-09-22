//
//  History.m
//  tabBar
//
//  Created by 1808 on 15/11/27.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "History.h"

@interface History ()

@end

@implementation History

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0,30, 200, 100)];
    lb.text = @"   你还没有任何定单信息。。。";
    [self.view addSubview:lb];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
