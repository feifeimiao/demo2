//
//  ZTFPageView.m
//  分页封装
//
//  Created by feifei on 16/4/26.
//  Copyright © 2016年 赵腾飞. All rights reserved.
//

#import "ZTFPageView.h"
@interface ZTFPageView () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (weak , nonatomic) NSTimer *time;
@property (weak, nonatomic) IBOutlet UIPageControl *page;


@end

@implementation ZTFPageView

//加载xib
+ (instancetype)pageView
{
    return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self)owner:nil options:nil] firstObject];
}



- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat w = self.scrollView.frame.size.width;
    CGFloat h = self.scrollView.frame.size.height;
    

    
    for (int i = 0; i < imageNames.count; i++) {
    
        UIImageView *imageViews = [[UIImageView alloc]init];
        imageViews.image = [UIImage imageNamed:imageNames[i]];
        imageViews.frame = CGRectMake(i * w, 0, w, h);
        

        [self.scrollView addSubview:imageViews];
        
        
    }
    
    self.scrollView.layer.cornerRadius = 10;
    self.scrollView.contentSize = CGSizeMake(imageNames.count * w, 0);
    
    self.scrollView.pagingEnabled = YES;
     self.scrollView.showsHorizontalScrollIndicator = NO;
    self.page.numberOfPages = imageNames.count;
    
    [self kaiqi];
}


-(void)kaiqi
{
    
    self.time = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(getTime) userInfo:nil repeats:YES];
    
    //多线程
    [[NSRunLoop mainRunLoop] addTimer:self.time forMode:NSRunLoopCommonModes];
}

-(void)guanbi
{
    [self.time invalidate];
}

- (void)getTime;
{
    // 计算下一页的页码
    NSInteger paer = self.page.currentPage + 1;
    
    // 超过最后一页
    if (paer == 5) {
        paer = 0;
    }
    // 滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(paer * self.scrollView.frame.size.width, 0) animated:YES];
    
    
}
//当用户拖拽时
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self guanbi];
}

//拖拽事件完毕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self kaiqi];
}

//移动时切换页数

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int pag = (int)scrollView.contentOffset.x / self.scrollView.frame.size.width + 0.5;
    
    self.page.currentPage = pag;
    
}


@end
