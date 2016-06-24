//
//  ZTF1TableViewController.m
//  binke
//
//  Created by feifei on 16/6/6.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTF1TableViewController.h"

#import "ZTFSaoController.h"

#import "UIImage+Image1.h"

#import "UIBarButtonItem+item.h"

#import "UIView+Frame.h"

#import "ZTFSYTableViewCell.h"

#import "ZTFPageView.h"


    static NSString *ID = @"cellID";
@interface ZTF1TableViewController ()<UISearchBarDelegate>

@property (strong , nonatomic) UIButton *btn;

@property (strong , nonatomic) ZTFSYTableViewCell *ce;

@end 

@implementation ZTF1TableViewController


- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = NO;
    
    self.tableView.rowHeight = 160;

    [self addNB];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZTFSYTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    

    
    

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.tableView.tableHeaderView.frame = CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width - 10, 160);

 
}


//添加item
- (void)addNB{
//    //tit
    UISearchBar *se = [[UISearchBar alloc]initWithFrame:CGRectZero];
    se.placeholder = @"缤刻购物狂欢节";
    [se sizeToFit];
    [se setSearchFieldBackgroundImage:[UIImage imageNamed:@"bg_user"] forState:UIControlStateNormal];

//    [se setSearchFieldBackgroundImage:[UIImage imageNamed:@"bg_user"] forState:UIControlStateNormal];

    
    self.navigationItem.titleView = se;
    self.navigationItem.titleView.width = 20;
    
    

    
//    [se setTranslucent:YES];
    //right
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"icon_sao"] selImage:nil  target:self action:@selector(sao)];

    //left
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"icon_map_white"] selImage:nil name:@"   广州" target:self action:nil];
    
}


//二维码界面
- (void)sao
{
 
    ZTFSaoController *sao = [[ZTFSaoController alloc]init];
    
    sao.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sao animated:YES];
    
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {


    UITableViewCell *cell1 = [[UITableViewCell alloc]init];
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0){
        ZTFSYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
cell.vi.layer.cornerRadius = 10;
    
    cell.vi.superview.layer.cornerRadius = 10;
        cell.backgroundColor  = [UIColor lightGrayColor];
    cell.layer.cornerRadius = 10;
    cell.selectedBackgroundView.layer.cornerRadius = 10;
       
       cell1 = cell;
    }
  
//    cell.backgroundView.subviews[0] = cell[indexPath]section
   
 return cell1;
    
}






@end
