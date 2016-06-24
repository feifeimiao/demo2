//
//  ZTFSYTableViewCell.m
//  binke
//
//  Created by feifei on 16/6/20.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFSYTableViewCell.h"

#import "UIView+Frame.h"

#import "ZTFPageView.h"

@interface ZTFSYTableViewCell ()


@end
@implementation ZTFSYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
    ZTFPageView *pageView = [ZTFPageView pageView];
    
    pageView.frame = self.vi.frame;
    
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    
    self.vi.layer.cornerRadius = 10;
    
    [self.contentView addSubview:pageView];
}





- (void)layoutSubviews
{
    [super layoutSubviews];

    UIView *vv = self.contentView.subviews[0];
    
    vv.frame = CGRectMake(0,  0, self.contentView.frame.size.width , self.contentView.frame.size.height);

}

- (void)setFrame:(CGRect)frame
{
//      self.sv.frame = CGRectMake(self.x, self.y, self.width, self.heigth);
    frame.origin.x += 10;
    frame.size.width -= 20;

    
    [super setFrame:frame];
}


@end
