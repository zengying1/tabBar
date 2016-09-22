//
//  RemoveViewController.h
//  BB
//
//  Created by Oreal51 on 16/4/8.
//  Copyright © 2016年 Oreal51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RemoveViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *countText;
- (IBAction)tapLoginOut:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *passwordText;
@property (strong, nonatomic) IBOutlet UITextField *numText;

@end
