//
//  Login.m
//  tabBar
//
//  Created by 1808 on 15/11/27.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "Login.h"
#import <BmobSDK/Bmob.h>
#import "ViewController.h"
#import "AppDelegate.h"
@interface Login ()
@property(nonatomic,strong)NSMutableArray *user;
@end

@implementation Login
//- (void)backToRootViewController{
//    UIViewController* vc = [ViewController instance].navigationController.visibleViewController;
//    if ([vc isEqual:[MainViewController instance]]) return;
//    if (vc.presentingViewController) {
//        [vc dismissViewControllerAnimated:NO completion:^{
//            [self backToRootViewController];
//        }];
//    }
//    else{
//        [vc.navigationController popViewControllerAnimated:NO];
//        [self backToRootViewController];
//    }
//}
-(void)bmobquery{
    NSString *username1 = self.countName.text;
    NSString *password1 = self.passWord.text;
    BmobQuery *bquery = [BmobQuery queryWithClassName:@"user"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        _user = [[NSMutableArray alloc]init];
        for (int i = 0; i<array.count; i++)
        {
            NSString *Baccount =[array[i] objectForKey:@"Baccount"];
            NSString *Bpassword =[array[i] objectForKey:@"Bpassword"];
            [_user insertObject:@{@"Baccount":Baccount,@"Bpassword":Bpassword} atIndex:i];
            if (([username1 isEqualToString:Baccount])&&([password1 isEqualToString:Bpassword]))
            {
                [(AppDelegate*)[UIApplication sharedApplication].delegate showWindHome];
            }
            else if((![username1 isEqualToString:Baccount])||(![password1 isEqualToString:Bpassword]))
            {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"你输入的帐号或密码有误！" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:cancelAction];
                [self presentViewController:alertController animated:YES completion:nil];
            }
        }
    }];
}


- (IBAction)LoginIn:(id)sender {
     [self bmobquery];
}

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
    
    [_passWord resignFirstResponder];
    
}

    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
