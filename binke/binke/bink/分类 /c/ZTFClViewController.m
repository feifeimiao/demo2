//
//  ZTFClViewController.m
//  binke
//
//  Created by feifei on 16/6/24.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFClViewController.h"
#import "UIView+Frame.h"
#define ZTFScreenW [UIScreen mainScreen].bounds.size.width
#define ZTFScreenH [UIScreen mainScreen].bounds.size.height

static NSString * const ID2 = @"coll";

static NSString * const ID3 = @"coll1";
@interface ZTFClViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak , nonatomic) UITableView *leftTable;
@property (weak , nonatomic) UITableView *rightTable;

@end

@implementation ZTFClViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   
    [self addChildView];
    
}


- (void)addChildView{

    UITableView *leftTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,ZTFScreenW / 4 , self.view.heigth)];
    leftTable.backgroundColor = [UIColor grayColor];
     [leftTable registerClass:[UITableViewCell class] forCellReuseIdentifier:ID2];
    leftTable.delegate = self;
    leftTable.dataSource = self;
    _leftTable = leftTable;
    leftTable.contentInset = UIEdgeInsetsMake(35, 0, 49, 0);
    [self.view addSubview:leftTable];
   
    
    UITableView *rightTable = [[UITableView alloc]initWithFrame:CGRectMake(leftTable.width, 0, ZTFScreenW - leftTable.width, self.view.heigth)];
    rightTable.backgroundColor = [UIColor blueColor];
//    [rightTable registerClass:[UITableViewCell class] forCellReuseIdentifier:ID3];
//    rightTable.delegate = self;
//    rightTable.dataSource = self;
    [self.view addSubview:rightTable];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    if (tableView == self.leftTable) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID2];
    
    cell.textLabel.text = [NSString stringWithFormat:@"全部 %ld",indexPath.row];
    
    return cell;
    
    


}



@end
