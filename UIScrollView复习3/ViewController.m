//
//  ViewController.m
//  UIScrollView复习3
//
//  Created by liuxingchen on 16/9/7.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int count = 5;
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;
    for (int i = 0;i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *name = [NSString stringWithFormat:@"img_0%d", i];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * width, 0, width,height);
        [self.scrollView addSubview:imageView];
    }
    CGFloat contentW = count * width;
    self.scrollView.contentSize = CGSizeMake(contentW,0);
    //分页功能
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //pageControl总共的页数
    self.pageControl.numberOfPages = count;
    self.scrollView.delegate = self;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /*
     如果想算出currentPage是第几个那么需要算出
     比例：scrollView的x偏移值 / scrollView的宽，
     为什么要这么算 如果当前是第一张图，滚动到显示第二张图显示一半的时候，那么这样就是算到滚动到第二张图了，往下以此类推的话就需要求出 比例
     为什么要在 比例后面加0.5
     0.3 > (int)(0.3 + 0.5) > 0
     0.6 > (int)(0.6 + 0.5) > 1
     小数四舍五入为整数 ： (int)(小数 + 0.5)
     currentPage 需要的是一个整数，所以需要强转成int类型
     */
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width +0.5);
    self.pageControl.currentPage = page;
    

}
@end
