//
//  kADScrolViewController.m
//  广告展示
//
//  Created by 张坤 on 15/12/23.
//  Copyright © 2015年 KZ. All rights reserved.
//

#import "kADScrolViewController.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define scrollViewHeight 240

@interface kADScrolViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    NSTimer *_timer;
    NSArray *_imageArray;
}
@end

@implementation kADScrolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setContentView];
}
- (void)setContentView{
   
   
    
    [self.view setBackgroundColor:[UIColor colorWithRed:148/255.0 green:147/255.0 blue:144/255.0 alpha:1.0]];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, screenWidth, scrollViewHeight)];
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
    
    _imageArray = [NSArray arrayWithObjects:@"thiPage.jpg",@"firPage.jpg",@"secPage.jpg",@"thiPage.jpg",@"firPage.jpg", nil];
    for (int i=0; i<_imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth*i, 0, screenWidth, scrollViewHeight)];
        [imageView setImage:[UIImage imageNamed:_imageArray[i]]];
        [_scrollView addSubview:imageView];
    }
    
    _scrollView.contentSize = CGSizeMake(screenWidth * _imageArray.count, scrollViewHeight);
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(screenWidth-60, scrollViewHeight - 10, 50, 30)];
    //图片的总数
    _pageControl.numberOfPages = _imageArray.count-2;
    //当前的图片
    _pageControl.currentPage = 0;
    //选中圆点的颜色
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    //未被选中圆点的颜色
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:_pageControl];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantPast]];
}
- (void)changeImage{
    int index = (int)(_scrollView.contentOffset.x/screenWidth)%3;
    index++;
    index = index%3;
    index = index==0?((int)_imageArray.count-2-1):index-1;
    _pageControl.currentPage = index;
    _scrollView.contentOffset = CGPointMake(screenWidth*(index+1), 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int index = _scrollView.contentOffset.x/screenWidth;
    index = index%3;
    index = index==0?((int)_imageArray.count-2-1):index-1;
    _pageControl.currentPage = index;
}
@end
