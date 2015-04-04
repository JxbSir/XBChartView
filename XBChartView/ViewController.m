//
//  ViewController.m
//  XBChartView
//
//  Created by Peter on 15/4/4.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "ViewController.h"
#import "XBChartView.h"
#import "XBChartCellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray* arr = [NSMutableArray array];
    XBChartView* chart = [[XBChartView alloc] initWithFrame:CGRectMake(0, 40, 375, 200)];
    for(int i = 31;i >=0;i--)
    {
        XBChartCellModel* item = [[XBChartCellModel alloc]init];
        item.title = [NSString stringWithFormat:@"3-%d",i];
        item.numOfShip = arc4random() % 100;
        item.numOfOrder = arc4random() % 100;
        item.numOfSale = arc4random() % 100;
        [arr addObject:item];
    }
    chart.tbDataSource = arr;
    [self.view addSubview:chart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
