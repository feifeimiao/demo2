//
//  ZTFNCCon.m
//  binke
//
//  Created by feifei on 16/6/6.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFNCCon.h"

#import "UIImage+Image1.h"

@interface ZTFNCCon ()

@end

@implementation ZTFNCCon


+ (void)initialize {
    //NSLog(@"%s",__func__);
    
    //获取整个应用程序的导航条
    //UINavigationBar *bar = [UINavigationBar appearance];
    
    //获取指定类下的所有UINavigationBar
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[ZTFNCCon class]]];
    

    
    [bar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[[UIImage alloc] init]];
    
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:86 / 255.0 green:33 / 255.0 blue:166 / 255.0 alpha:1]];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    

//    
    //设置导航条标题属性
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    [bar setTitleTextAttributes:dict];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];



//    self.navigationBar.barTintColor = [UIColor purpleColor];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
