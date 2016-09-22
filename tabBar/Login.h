//
//  Login.h
//  tabBar
//
//  Created by 1808 on 15/11/27.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *Login;
- (IBAction)LoginIn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *countName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *signIn;

@end
