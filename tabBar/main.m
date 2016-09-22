//
//  main.m
//  tabBar
//
//  Created by 1808 on 15/11/19.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>
int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSString *appKey = @"124e0494725c6deb03d04af6479cd330";
        [Bmob registerWithAppKey:appKey];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
