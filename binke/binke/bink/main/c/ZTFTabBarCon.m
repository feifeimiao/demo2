//
//  ZTFTabBarCon.m
//  binke
//
//  Created by feifei on 16/6/6.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFTabBarCon.h"

#import "ZTFNCCon.h"
#import "ZTFCarViewController.h"

#import "ZTFMyViewController.h"

#import "ZTFShopViewController.h"

#import "ZTFClassViewController.h"

#import "ZTF1TableViewController.h"

//#import "ZTFTabBar.h"

@interface ZTFTabBarCon ()



@end

@implementation ZTFTabBarCon




- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.tintColor = [UIColor purpleColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
   
    UITabBarItem *item = [UITabBarItem appearance];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:13];
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
[self addAllChildVC];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


//添加所有子控件
- (void)addAllChildVC
{
    ZTF1TableViewController *ho = [[ZTF1TableViewController alloc]init];
 
    [self addOneChidViewCon:ho image:[UIImage imageNamed:@"tab_home_nor"] selimage:[UIImage imageNamed:@"tab_home_sel"] name:@"首页"];
    
    ZTFClassViewController *class = [[ZTFClassViewController alloc]init];
    [self addOneChidViewCon:class image:[UIImage imageNamed:@"tab_class_nor"] selimage:[UIImage imageNamed:@"tab_class_sel"] name:@"分类"];
    
    ZTFCarViewController *car = [[ZTFCarViewController alloc]init];
    [self addOneChidViewCon:car image:[UIImage imageNamed:@"tab_car_nor"] selimage:[UIImage imageNamed:@"tab_car_sel"] name:@"购物车"];
    
    ZTFShopViewController *shop = [[ZTFShopViewController alloc]init];
    [self addOneChidViewCon:shop image:[UIImage imageNamed:@"tab_shop_nor"] selimage:[UIImage imageNamed:@"tab_shop_sel"] name:@"商城"];

    ZTFMyViewController *uer = [[ZTFMyViewController alloc]init];
    [self addOneChidViewCon:uer image:[UIImage imageNamed:@"tab_uer_nor"] selimage:[UIImage imageNamed:@"tab_uer_sel"] name:@"个人"];

    


    
}
//添加一个子控件
- (void)addOneChidViewCon:(UIViewController *)vc image:(UIImage *)image selimage:(UIImage *)selimage name:(NSString *)name
{
    
    ZTFNCCon *nc = [[ZTFNCCon alloc]initWithRootViewController:vc];
    
//    nc.navigationItem.title = name;
    
    nc.tabBarItem.title = name;
    
    
    nc.tabBarItem.image = image;
    
    nc.tabBarItem.selectedImage = selimage;
    
//    [self.arr addObject:nc.tabBarItem];
    
    [self addChildViewController:nc];
    
    
}
@end
