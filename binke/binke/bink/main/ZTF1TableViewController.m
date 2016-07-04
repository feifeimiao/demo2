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

#import "SDCycleScrollView.h"


    static NSString * const ID = @"cell";
@interface ZTF1TableViewController ()<UISearchBarDelegate>

@property (strong , nonatomic) UIButton *btn;

@property (strong , nonatomic) ZTFSYTableViewCell *ce;

@end 

@implementation ZTF1TableViewController

//
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);

    [self addNB];
    
    [self.tableView registerClass:[ZTFSYTableViewCell class] forCellReuseIdentifier:ID];
    

    
    

}



//添加item
- (void)addNB{
//    //tit
    UISearchBar *se = [[UISearchBar alloc]initWithFrame:CGRectZero];
    se.placeholder = @"缤刻购物狂欢节";
    [se sizeToFit];

    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZTFSYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
 

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    return 200;
}






@end
