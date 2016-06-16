//
//  UIBarButtonItem+item.m
//  binke
//
//  Created by feifei on 16/6/16.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)

+ (instancetype)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage name:(NSString *)name target:(id)target action:(SEL)action{
    
    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rBtn setImage:image forState:UIControlStateNormal];
    
    rBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [rBtn setImage:selImage forState:UIControlStateHighlighted];
    
    [rBtn setTitle:name forState:UIControlStateNormal];
    
    [rBtn sizeToFit];
    
    [rBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView *v = [[UIView alloc]initWithFrame:rBtn.bounds];
    
    [v addSubview:rBtn];
    
    return [[UIBarButtonItem alloc]initWithCustomView:v];
}
+ (instancetype)itemWithImage:(UIImage *)image selImage:(UIImage *)selImage  target:(id)target action:(SEL)action
{
    
    UIButton *rBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rBtn setImage:image forState:UIControlStateNormal];
    
    [rBtn setImage:selImage forState:UIControlStateHighlighted];
    
    

    [rBtn sizeToFit];
    
    [rBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    rBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    UIView *v = [[UIView alloc]initWithFrame:rBtn.bounds];
    
    
    
    
    [v addSubview:rBtn];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:v];

    
}


@end
