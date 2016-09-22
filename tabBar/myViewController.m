//
//  myViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/22.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "myViewController.h"
#import "History.h"
#import "Me.h"
#import "Password.h"
#import "Treaty.h"
#import "Versions.h"
#import "Login.h"
#import <BmobSDK/Bmob.h>

@interface myViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *personalTableView;
    NSArray *dataSource;
}
#define SCREEN_WIDTH 375
#define SCREEN_HEIGHT 618
@end

@implementation myViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    personalTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:personalTableView];
    personalTableView.delegate=self;
    personalTableView.dataSource=self;
    personalTableView.showsVerticalScrollIndicator = NO;//不显示右侧滑块
    personalTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;//分割线
    dataSource=@[@"历史订单",@"个人信息",@"密码管理",@"用户协议",@"关于版本"];
}

#pragma mark tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //分组数 也就是section数
    return 3;
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if (section==1) {
        return dataSource.count;
    }else{
        return 1;
    }
}

//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 5;
}

//自定义每行的状态
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{  if (indexPath.section == 1)
    {
        if (indexPath.row ==0) {
            History *hs = [[History alloc]init];
            [self.navigationController pushViewController:hs animated:NO];
        }else if(indexPath.row ==1)
            {
                Me *me = [[Me alloc]init];
                [self.navigationController pushViewController:me animated:NO];
            }
        else if (indexPath.row ==2)
            {
                Password *passWord = [[Password alloc]init];
                [self.navigationController pushViewController:passWord animated:NO];
            }
        else if (indexPath.row == 3)
            {
                Treaty *treaty = [[Treaty alloc]init];
                [self.navigationController pushViewController:treaty animated:NO];
            }
        else
            {
                Versions *versions = [[Versions alloc]init];
                [self.navigationController pushViewController:versions animated:NO];
            }
        }
    else if(indexPath.section == 2)
    {
//        LoginViewController *login = [[LoginViewController alloc]init];
        Login *login = [[Login alloc]init];
//        [self.navigationController pushViewController:login animated:NO];
        
        [self presentViewController:login animated:YES completion:nil];
    }
    
}
//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 120;
    }
    return 50;
}

//设置每行对应的cell（展示的内容）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    if (indexPath.section==0) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(12, 5, 110, 110)];
        imageView.image = [UIImage imageNamed:@"1.png"];
        [cell.contentView addSubview:imageView];
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 20, 60, 40)];
        nameLabel.text=@"曾盈";
        [cell.contentView addSubview:nameLabel];
        UILabel *numLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 80, 100, 40)];
        numLabel.text = @"1234556";
        [cell.contentView addSubview:numLabel];
    }else if (indexPath.section==1) {
        cell.textLabel.text=[dataSource objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text=@"退出登陆";
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
    }
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
