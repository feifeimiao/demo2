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

@interface ZTF1TableViewController ()<UISearchBarDelegate>

@property (strong , nonatomic) UIButton *btn;

@end 

@implementation ZTF1TableViewController


- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.separatorStyle = NO;
  
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
   

    
    [btn setTitle:@"  广州 " forState:UIControlStateNormal];

    
    [btn setImage:[UIImage imageNamed:@"icon_map_white"] forState:UIControlStateNormal];
    
 
    btn.imageView.tintColor = [UIColor whiteColor];
    
 
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UISearchBar *se = [[UISearchBar alloc]init];

    
    se.placeholder = @"缤刻购物狂欢节";
    
    
    
    self.navigationItem.titleView = se;
    
    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rBtn setTintColor:[UIColor whiteColor]];
    
    [rBtn setImage:[UIImage imageNamed:@"icon_sao"] forState:UIControlStateNormal];
    
    [rBtn sizeToFit];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rBtn];
    
    [rBtn addTarget:self action:@selector(sao) forControlEvents:UIControlEventTouchUpInside];
    
}



- (void)sao
{
 
    ZTFSaoController *sao = [[ZTFSaoController alloc]init];
    

    [self.navigationController pushViewController:sao animated:YES];
      
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }

cell.textLabel.text = @"ccc";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{

}
 


@end
