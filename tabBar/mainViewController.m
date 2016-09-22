//
//  mainViewController.m
//  tabBar
//
//  Created by 1808 on 15/11/19.
//  Copyright (c) 2015年 1808. All rights reserved.
//
#import "LiuViewController.h"
#import "mainViewController.h"
#import "ScanViewController.h"
#import "CollectionViewCell.h"
@interface mainViewController ()
@property (strong,nonatomic)NSMutableArray *baseDate;

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(scan:)];
    UICollectionViewFlowLayout * layout =[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(180, 200);
    
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    collect.delegate=self;
    collect.dataSource=self;
    collect.backgroundColor = [UIColor grayColor];
    
    UINib *uinib = [UINib nibWithNibName:@"CollectionViewCell"bundle:nil];
    [collect registerNib:uinib forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:collect];
  
}

#pragma mark - UICollectionView
//返回分区个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiuViewController *liuViewController = [[LiuViewController alloc]init];
    [self.navigationController pushViewController:liuViewController animated:YES];
}



#pragma 扫描
- (void)scan:(id)sender{
    ScanViewController *scan = [[ScanViewController alloc]init];
    [self.navigationController pushViewController:scan animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
