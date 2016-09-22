//
//  gouwucheViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/22.
//  Copyright (c) 2015年 1808. All rights reserved.
//
#import "DetailViewController.h"
#import "gouwucheViewController.h"
#import "ScanViewController.h"
#import <BmobSDK/Bmob.h>
#define SCREEN_WIDTH 375
#define SCREEN_HEIGHT 618

@interface gouwucheViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *lineTableView;
@property (strong,nonatomic)NSMutableArray *gouData;
@property (strong,nonatomic)UILabel *nameLable1;
@end

@implementation gouwucheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bmobquery];
    [self tableviewInit];
}

-(UITableView*)tableviewInit{
    _lineTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _lineTableView.dataSource = self;
    _lineTableView.delegate = self;
    _lineTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_lineTableView];
    return _lineTableView;
}

#pragma mark tableViewDelegate
//一个组里有多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_gouData count];
}


//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (buttonIndex == 1) {
        
        ScanViewController *scan = [[ScanViewController alloc]init];
        [self.navigationController pushViewController:scan animated:NO];
    }

}

- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
    
}

- (void)removeObjectAtIndex:(NSUInteger)index{
    
}

-  (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.gouData removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationTop];
    }
}

//cell的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 90, 90)];
    imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row + 1]];
    [cell.contentView addSubview:imageView];
    UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(110, -10, 200, 60)];
    nameLabel.text = _gouData[indexPath.row][@"Btradename"];
    [cell.contentView addSubview:nameLabel];
    _nameLable1=[[UILabel alloc]initWithFrame:CGRectMake(200, 50, 200, 60)];
    _nameLable1.text =_gouData[indexPath.row][@"Bdetail"];
    [cell.contentView addSubview:_nameLable1];
    return cell;
}


-(void)bmobquery{
     BmobQuery *bquery = [BmobQuery queryWithClassName:@"gouwuche"];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        _gouData = [[NSMutableArray alloc]init];
        for (int i = 0; i<array.count; i++) {
            NSString *Bdetail =[array[i] objectForKey:@"Bdetail"];
            NSString *Btradename =[array[i] objectForKey:@"Btradename"];
            [_gouData insertObject:@{@"Bdetail":Bdetail,@"Btradename":Btradename} atIndex:i];
          
        }
        [self.lineTableView reloadData];
    }];
}//查询数据库

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
