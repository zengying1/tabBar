//
//  RemoveViewController.m
//  BB
//
//  Created by Oreal51 on 16/4/8.
//  Copyright © 2016年 Oreal51. All rights reserved.
//
//#import "LoginViewController.h"
#import "RemoveViewController.h"
#import "ViewController.h"
//#import "LoginViewController.h"
@interface RemoveViewController ()<NSCoding>

@end

@implementation RemoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.view addGestureRecognizer:tapGestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    
    [_numText resignFirstResponder];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)tapLoginOut:(id)sender {
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //获取用户输入的信息
    NSString *username = self.countText.text;
    NSString *password = self.passwordText.text;
    [userDefaults setObject:username forKey:@"name"];
    [userDefaults setObject:password forKey:@"pw"];
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *passWord = [ user objectForKey:@"password"];
//    NSLog(@"%@",passWord);
//    //移除UserDefaults中存储的用户信息
//    [userDefaults removeObjectForKey:@"name"];
//    [userDefaults removeObjectForKey:@"pass word"];
//    [userDefaults synchronize];
//    if (<#condition#>) {
//        <#statements#>
//    }
    
//    LoginViewController *mainViewController = [[LoginViewController alloc]init];
//
    ViewController *mainViewController = [[ViewController alloc]init];
    [self presentViewController:mainViewController animated:YES completion:^{ }];
}
@end
