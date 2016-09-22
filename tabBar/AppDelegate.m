//
//  AppDelegate.m
//  tabBar
//
//  Created by 1808 on 15/11/19.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "myViewController.h"
#import "gouwucheViewController.h"
#import "remaiViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [self showWindHome];
    //[(AppDelegate*)[UIApplication sharedApplication].delegate showWindHome];
    [_window makeKeyAndVisible];
    return YES;
}

-(void)showWindHome{
    UITabBarController *tabC = [[UITabBarController alloc]init];
    tabC.tabBar.tintColor = [UIColor whiteColor];
    tabC.tabBar.barTintColor = [UIColor colorWithRed:154/255.0 green:37/255.021/255.0 blue:21/255.0  alpha:1];
    
    mainViewController *mainvc = [[mainViewController alloc]init];
    id obj1 =[self setTabBarInfoWithVC:mainvc imageName:@"shouye"title:@"首页"];
    
    gouwucheViewController *gouwuchevc = [[gouwucheViewController alloc]init];
    id obj2 =[self setTabBarInfoWithVC:gouwuchevc imageName:@"gouwuche" title:@"购物车"];
    
    remaiViewController *remaivc = [[remaiViewController alloc]init];
    id obj3 =[self setTabBarInfoWithVC:remaivc imageName:@"remai" title:@"热卖"];
    remaivc.tabBarItem.badgeValue = @"20";
    remaivc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d+",[remaivc.tabBarItem.badgeValue intValue]+1];
    
    myViewController *myvc = [[myViewController alloc]init];
    id obj4 =[self setTabBarInfoWithVC:myvc imageName:@"wode" title:@"我的"];
    
    tabC.viewControllers=@[obj1,obj3,obj2,obj4];
    _window.rootViewController = tabC;
}

- (id)setTabBarInfoWithVC:(UIViewController *)vc imageName:(NSString *)imageName title:(NSString *)title
    {
        vc.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:imageName];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        nav.navigationBar.barTintColor =[UIColor colorWithRed:154/255.0 green:37/255.021/255.0 blue:21/255.0  alpha:1];
        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:21]}];
        return nav;
    }



- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
