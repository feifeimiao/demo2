//
//  ZTFPageView.h
//  分页封装
//
//  Created by feifei on 16/4/26.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZTFPageView : UIView

+ (instancetype)pageView;

@property (strong , nonatomic) NSArray *imageNames;
@end
