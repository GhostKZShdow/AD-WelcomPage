//
//  ViewController.m
//  UIScrollView
//
//  Created by 张坤 on 16/4/11.
//  Copyright © 2016年 KZ. All rights reserved.
//

#import "ViewController.h"
#import "kADScrolViewController.h"
#import "KHelloViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titles;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"UIScrollView";
    CGRect rect = self.view.bounds;
    UITableView *tableView = [[UITableView alloc]initWithFrame:rect];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    _titles = @[@"广告展示页",@"欢迎页"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.textLabel setText:_titles[indexPath.row]];
    return cell;
}
#pragma mark-UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        kADScrolViewController *kVC = [[kADScrolViewController alloc]init];
        kVC.title = _titles[0];
        [self.navigationController pushViewController:kVC animated:YES];
    } else if (indexPath.row == 1) {
        KHelloViewController *kHelloVC = [[KHelloViewController alloc]init];
        kHelloVC.title = _titles[1];
        [self.navigationController pushViewController:kHelloVC animated:YES];
    }
}
@end
