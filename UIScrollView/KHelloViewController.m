//
//  KHelloViewController.m
//  欢迎页
//
//  Created by 张坤 on 15/12/23.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "KHelloViewController.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height
@interface KHelloViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@end

@implementation KHelloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    _scrollView.delegate = self;
    //是否整页翻动
    _scrollView.pagingEnabled = YES;
    //是否显示水平方向的滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    //是否显示竖直方向的滚动条
    _scrollView.showsVerticalScrollIndicator = NO;
    //遇到边框是否反弹
    _scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
    
    //存放图片的数组
    NSArray *imgArray = [NSArray arrayWithObjects:@"firPage.PNG",@"secPage.PNG",@"thiPage.PNG", nil];
    for (int i=0; i<imgArray.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth * i, 0, screenWidth, screenHeight)];
        [imgView setImage:[UIImage imageNamed:imgArray[i]]];
        [_scrollView addSubview:imgView];
    }
    //滚动范围的大小
    _scrollView.contentSize = CGSizeMake(screenWidth * imgArray.count, 0);
    //监控目前滚动的位置
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(screenWidth/2-25, screenHeight - 50, 50, 50)];
    //总的数量
    _pageControl.numberOfPages = imgArray.count;
    //当前页
    _pageControl.currentPage = 0;
    //设置选中页的圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    //设置非选中页的圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor purpleColor];
    
    [self.view addSubview:_pageControl];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark-UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/screenWidth;
    _pageControl.currentPage = page;
}
@end
