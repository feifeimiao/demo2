//
//  ZTFSYTableViewCell.m
//  binke
//
//  Created by feifei on 16/6/20.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFSYTableViewCell.h"

#import "UIView+Frame.h"
#import "SDCycleScrollView.h"

@interface ZTFSYTableViewCell ()


@end
@implementation ZTFSYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];


    

}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    
    if (self = [ super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSArray *imageNames = @[@"h1.jpg",
                                @"h2.jpg",
                                @"h3.jpg",
                                @"h4.jpg",
                                // 本地图片请填写全名
                                ];
            SDCycleScrollView *xunhuan = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0  , 0, self.width, self.heigth) imageNamesGroup:imageNames];

        xunhuan.autoScrollTimeInterval = 5;
        [self.contentView addSubview:xunhuan];
        
    
        
        self.backgroundColor = [UIColor clearColor];
        self.selected = NO;
    }
    
    return self;

    

}




- (void)layoutSubviews
{
    [super layoutSubviews];

    UIView *view1 = self.contentView.subviews[0];
    
    
    view1.frame = CGRectMake(0, 0, self.width, self.heigth);
    self.contentView.layer.cornerRadius = 6;
    self.contentView.layer.masksToBounds = YES;


  
}

- (void)setFrame:(CGRect)frame
{

    frame.origin.x += 10;
    frame.size.width -= 20;

    
    [super setFrame:frame];
}


@end
