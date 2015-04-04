//
//  XBChartView.m
//  PSS
//
//  Created by Peter on 15/4/4.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "XBChartView.h"
#import "XBChartCell.h"
#import "XBChartCellModel.h"
#import "UIColor+hexColor.h"

@interface XBChartView ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tbView;
}
@end

@implementation XBChartView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initialUIs:frame];
    }
    return self;
}

- (void)initialUIs:(CGRect)frame
{
    tbView = [[UITableView alloc] initWithFrame:CGRectMake((frame.size.width - chartViewWidth)/2, -(frame.size.width - chartViewWidth)/2, chartViewWidth, frame.size.width) style:UITableViewStyleGrouped];
    tbView.backgroundColor = [UIColor whiteColor];
    tbView.delegate = self;
    tbView.dataSource = self;
    tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tbView.showsVerticalScrollIndicator = NO;
    tbView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    [self addSubview:tbView];
    
    UIImageView* imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height - chartCellTitleHeight, frame.size.width, 0.5)];
    imgLine.backgroundColor = [UIColor hexFloatColor:@"dedede"];
    [self addSubview:imgLine];
    
    UIImageView *imgShip = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 100, 10, 10, 10)];
    imgShip.backgroundColor = [UIColor hexFloatColor:@"b6b6b6"];
    imgShip.layer.cornerRadius = 2;
    [self addSubview:imgShip];
    
    UILabel *lblShip = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 90, 9, 15, 11)];
    lblShip.text = @"发";
    lblShip.textColor = [UIColor grayColor];
    lblShip.font = [UIFont systemFontOfSize:11];
    [self addSubview:lblShip];
    
    UIImageView *imgOrder = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 70, 10, 10, 10)];
    imgOrder.backgroundColor = [UIColor hexFloatColor:@"898989"];
    imgOrder.layer.cornerRadius = 2;
    [self addSubview:imgOrder];
    
    UILabel *lblOrder = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 60, 9, 15, 11)];
    lblOrder.text = @"订";
    lblOrder.textColor = [UIColor grayColor];
    lblOrder.font = [UIFont systemFontOfSize:11];
    [self addSubview:lblOrder];
    
    UIImageView *imgSale = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - 40, 10, 10, 10)];
    imgSale.backgroundColor = [UIColor hexFloatColor:@"da0229"];
    imgSale.layer.cornerRadius = 2;
    [self addSubview:imgSale];
    
    UILabel *lblSale = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 30, 9, 15, 11)];
    lblSale.text = @"分";
    lblSale.textColor = [UIColor grayColor];
    lblSale.font = [UIFont systemFontOfSize:11];
    [self addSubview:lblSale];
    
    UIImageView *imgMid = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - chartCellHeight) / 2, 0, chartCellHeight, chartViewWidth - chartCellTitleHeight)];
    imgMid.backgroundColor = [UIColor blackColor];
    imgMid.alpha = 0.1;
    [self addSubview:imgMid];

}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tbDataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        CGFloat h = self.bounds.size.width / 2 - chartCellHeight / 2;
        return h;
    }
    return 5.;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == _tbDataSource.count - 1)
    {
        CGFloat h = self.bounds.size.width / 2 - chartCellHeight / 2;
        return h;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return chartCellHeight;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* vvv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, chartViewWidth, 10)];
    vvv.backgroundColor = [UIColor whiteColor];
    return vvv;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* vvv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, chartViewWidth, 10)];
    vvv.backgroundColor = [UIColor whiteColor];
    return vvv;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identyfier = @"xbChartCell";
    XBChartCell* cell = [tableView dequeueReusableCellWithIdentifier:identyfier];
    if(!cell)
    {
        cell = [[XBChartCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identyfier];
    }
    XBChartCellModel* item = [_tbDataSource objectAtIndex:indexPath.section];
    [cell setChartValue:100 item:item];
    return cell;
}

#pragma mark - scrollview
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate)
    {
        CGFloat y = scrollView.contentOffset.y;
        int rowTmp = y / ((chartCellHeight + 10) / 2);
        int row = rowTmp / 2 + rowTmp % 2;
        NSLog(@"%d",row);
        [tbView setContentOffset:CGPointMake(0, row * (10 + chartCellHeight)) animated:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    int rowTmp = y / ((chartCellHeight + 10) / 2);
    int row = rowTmp / 2 + rowTmp % 2;
    NSLog(@"%d",row);
    [tbView setContentOffset:CGPointMake(0, row * (10 + chartCellHeight)) animated:YES];
}

@end
