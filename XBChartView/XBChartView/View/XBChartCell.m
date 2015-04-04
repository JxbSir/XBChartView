//
//  XBChartCell.m
//  PSS
//
//  Created by Peter on 15/4/3.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "XBChartCell.h"
#import "UIColor+hexColor.h"

@interface XBChartCell()
{
    CAShapeLayer     *chartShip;
    CAShapeLayer     *chartOrder;
    CAShapeLayer     *chartSale;
    UILabel          *lblTitle;
}

@end

@implementation XBChartCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
 
        chartShip = [[CAShapeLayer alloc] init];
        chartShip.fillColor       = [UIColor hexFloatColor:@"b6b6b6"].CGColor;
        [self.layer addSublayer:chartShip];
        
        chartOrder = [[CAShapeLayer alloc] init];
        chartOrder.fillColor       = [UIColor hexFloatColor:@"898989"].CGColor;
        [self.layer addSublayer:chartOrder];
        
        chartSale = [[CAShapeLayer alloc] init];
        chartSale.fillColor       = [UIColor hexFloatColor:@"da0229"].CGColor;
        [self.layer addSublayer:chartSale];
        
        lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(chartViewWidth - chartCellTitleHeight - chartCellTitleHeight, (chartCellHeight - chartCellTitleHeight) / 2, chartCellHeight, chartCellTitleHeight)];
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.textColor = [UIColor grayColor];
        lblTitle.font = [UIFont systemFontOfSize:13];
        lblTitle.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        [self addSubview:lblTitle];
    }
    return self;
}


- (void)setChartValue:(CGFloat)basic item:(XBChartCellModel*)item
{
    CGFloat basicWidth  = chartViewWidth - 45;
    
    chartShip.path = [UIBezierPath bezierPathWithRect:CGRectMake(chartViewWidth - basicWidth * (item.numOfShip / basic) - chartCellTitleHeight, chartCellHeight / 3 * 2, basicWidth * (item.numOfShip / basic), chartCellHeight / 3)].CGPath;
    
    chartOrder.path = [UIBezierPath bezierPathWithRect:CGRectMake(chartViewWidth - basicWidth * (item.numOfOrder / basic) - chartCellTitleHeight, chartCellHeight / 3, basicWidth * (item.numOfOrder / basic), chartCellHeight / 3)].CGPath;

    chartSale.path = [UIBezierPath bezierPathWithRect:CGRectMake(chartViewWidth - basicWidth * (item.numOfSale / basic) - chartCellTitleHeight, 0, basicWidth * (item.numOfSale / basic), chartCellHeight / 3)].CGPath;
    
    lblTitle.text = item.title;
}

@end
