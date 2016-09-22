//
//  remaiViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/22.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "remaiViewController.h"

@interface remaiViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *rightTableView;
    UITableView *leftTableView; 
    NSArray *dataSource;
    NSArray *lineSource;
    NSMutableArray *imageArray;
}
@end

@implementation remaiViewController
#define SCREEN_WIDTH 375
#define SCREEN_HEIGHT 618
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
}

-(void)initTableView{
    rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-80, 0, SCREEN_WIDTH/2+80, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    rightTableView.delegate = self;
    rightTableView.dataSource = self;
    rightTableView.showsVerticalScrollIndicator = YES;//显示右侧滑栏
    rightTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;//分割线
    [self.view addSubview:rightTableView];
    
    
    leftTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH/2-80, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    leftTableView.dataSource = self;
    leftTableView.delegate = self;
    lineSource = @[@"水果",@"蔬菜",@"水果",@"蔬菜", @"水果"];
    imageArray = [NSMutableArray array];
    for (int i = 1; i <= 3; i++) {
        [imageArray addObject:[NSString stringWithFormat:@"%d.png",i]];
    }

    leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:leftTableView];
}
#pragma mark tableViewDelegate
//有多少个组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == rightTableView) {
        return 1;
    }else if (tableView == leftTableView) {
        return 1;
    }else {
        return 0;
    }
}

//设置每个分组下tableview的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if(tableView == leftTableView){
        return lineSource.count;
    }else
    {
        return 10;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
}

//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

//每一个分组下对应的tableview 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(tableView == leftTableView){
    return (SCREEN_HEIGHT-64)/5;
    }
    else{
        return 65;
    }
}

//设置每行对应的cell（展示的内容）
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(tableView ==rightTableView)//右边的tableview的cell内容
    {
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
        
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(12, 0, 50, 50)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%ld.png",indexPath.row+1]];
        [cell.contentView addSubview:imageView];
        
        UILabel *nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(70, -10, 100, 60)];
        nameLabel.text = @"商品名称";
        [cell.contentView addSubview:nameLabel];
        UILabel *lb1=[[UILabel alloc]initWithFrame:CGRectMake(180, 40, 70, 20)];
        lb1.text = @"单价：40 /袋";
        lb1.font =[UIFont fontWithName:@"Arial" size:10];
        [cell.contentView addSubview:lb1];
        UILabel *Label=[[UILabel alloc]initWithFrame:CGRectMake(70, 20, 100, 60)];
        Label.text = @"商品简介";
        Label.font = [UIFont fontWithName:@"Arial" size:15];
        [cell.contentView addSubview:Label];
        return cell;
    }
    else//带竖线的tableview的cell
    {
        static NSString *identifer=@"linecell";
        UITableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell1==nil) {
        cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        }
    
    cell1=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userinfo"];
    //画竖线
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 0, 1, (SCREEN_HEIGHT-64)/5)];
    view.backgroundColor = [UIColor grayColor];
    [cell1.contentView addSubview:view];
    //圆形图案
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(-5, 40, 10, 10)];
    button.backgroundColor = [UIColor brownColor];
    button.layer.cornerRadius = 5;
    [view addSubview:button];
    //横线
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 45, 20, 1)];
    view1.backgroundColor = [UIColor brownColor];
    [cell1.contentView addSubview:view1];
        
    UIButton *bt = [[UIButton alloc]initWithFrame:CGRectMake(40, 34, 50, 25)];
    bt.layer.cornerRadius = 5;
    bt.layer.borderWidth = 1;
    bt.layer.borderColor = [[UIColor blackColor]CGColor];
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(0, -10, 50, 50)];
    lb.text = lineSource[indexPath.row];
    lb.textAlignment =  NSTextAlignmentCenter ;
    [bt addSubview:lb];
    [cell1.contentView addSubview:bt];
    return cell1;
   }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
